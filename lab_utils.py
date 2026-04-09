# lab_utils.py — Day 3 공통 헬퍼
# 노트북에서 직접 수정할 필요 없습니다.

def make_ask(client, model, use_cache, snapshot):
    """
    ask() 헬퍼 팩토리.

    USE_CACHE=True 이거나 client 가 None 이면
    snapshot 딕셔너리에서 사전 저장된 응답을 반환합니다.

    사용법:
        ask = make_ask(client, MODEL, USE_CACHE, SNAPSHOT)
        result = ask("질문", system="지시문", _cache_key="키이름")
    """
    def ask(prompt, system=None, _cache_key=None):
        if use_cache or not client:
            if _cache_key and _cache_key in snapshot:
                print("📼 [사전 저장된 응답]")
                return snapshot[_cache_key]
            return "⚠️  캐시에 해당 항목이 없습니다. USE_CACHE=False 후 API 키로 실행하세요."

        from google.genai import types
        config = types.GenerateContentConfig(system_instruction=system) if system else None
        resp = client.models.generate_content(model=model, contents=prompt, config=config)
        return resp.text

    return ask
