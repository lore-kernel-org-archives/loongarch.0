Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8A631D72B
	for <loongarch@lists.linux.dev>; Tue, 23 Sep 2025 08:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758617727; cv=none; b=Fvq/DYJksvT536SFwvZyyrZtY4l3FbqjnY3bA5DqUZ+85WCQg1155Uo6y+ki+Avvp+t5MSTRdDBvtea0ZXhaRFwOykWXZCwUYvTTVmork7fWnqq7us9UFgqrsQn+p6XOpFj/L2fV3WbRcczuTCXdEvzPwmIdBKqQ8GmZ8OcCeIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758617727; c=relaxed/simple;
	bh=ncHCnrnycW16MMAxELB1xZy/QO2XTlz5Cj+ffFSDYJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J+leMWKfHqI9wjsh5k1tpHtg+29NlmURNK3UMdWOWqj0fmPLcyLsjUUpVCA7k89z1X+LIoZyen2hg4AAvKU+r/0EDcbwtKYYvXSQ8/DthENWCQH+PgtnZ60uSK0qe1empYDxwOx8AIycTsuvbhNcx4fMVw23EdqToRXMBRIULoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L7uuIyQY; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L7uuIyQY"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-27a6c3f482dso13180335ad.1
        for <loongarch@lists.linux.dev>; Tue, 23 Sep 2025 01:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758617725; x=1759222525; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LWOwPbM2fUTpsZY/pQNuzJg4wvjHz9XRhdTCKAJ8AeU=;
        b=L7uuIyQYukUcJayQXeNAzw/bhYrFgLHxOv53+PGY2vByaTot7s96hhfjWkl5D8YHIO
         bjiEERFqbXqsK4a6iw0mC+akLaNWN6GTxkzQMtm+twUduBa40dYxD1QYVB9TrghqU1q4
         EiXwx0kTbuqUWd/8VTrfDw/O6OCocWDZecF7rOSQ2UKFI6HxjaUMbQJCgBZZ7DZzevr4
         zST0OJumO3knzM5eIADL0UX6ul5MNIU0/85PxYvp/DxrWfHqPbkkbzLqUZf6hSp2bW5Y
         nu21g45fye3pQxUa+CVp4UmvkwRGRRVh4qzWDMhv3YPLiVRALwCCQMeFqnCkNZjBS8n+
         HcZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758617725; x=1759222525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LWOwPbM2fUTpsZY/pQNuzJg4wvjHz9XRhdTCKAJ8AeU=;
        b=Rk7oueom/JnH75WDMWHOyFIu8HCa2ORuFUDifp+IFqsErJDjUKIKVS70z1eINpyprt
         zQne56MIcYJ7n3AilZGlkW5NRtDFr8x+M475HM3KnkloAk9aoUnytDLz/IrnNlXG35UO
         xxH2XooShPsNhxcs3ZSdtovbw5kJR5GhTpYtOT4Wz5g+UWi7Mb8lJuo8zQfKkv1Md1AW
         JUVktECD57jODHaEja9mRo3F7VMUti7xPtxqBW3YgKneO8eP03lEkC7vT/HzWMquLjoc
         o1erN96WwedD+fKDyXi6z3je4GwSsMIW6VncKCq5C7rUxh/ES+qGn1+U2h0PYZneb2os
         8aNg==
X-Gm-Message-State: AOJu0Yz8+bpZlGdGtAKbVQbymARDG/ro485boj+c/5+SGsZ4aGJ+Ha5s
	XgdT9VmOqbfcX3ehM0AbF+2ZE8j0uqNsW9Zuf5dlxVbBz6d2TgtihRn431+CQGA/aFPiYQ==
X-Gm-Gg: ASbGncsojwTvfzo+W+6Fn6iyeNkg1GWVGqDDz08yAYOw933wn7r4eamAvyFaccJnrWj
	7u185ZdT+zD8vwkwdexsJdEQ8BOHI6Ai1MQzAAP0aAa8hRQHAo2X4eK02p4cQBdVN1u7DvK49tX
	iuaWtXzt10sT3zVsYt0TapJ9wBTIO3h3k9CDKW5jjOz/nj5xlizbOYjGfQvmR8zRlRUMPISc4qA
	N0PVhQY1dIw5vJj08FIVkIDGpwp5qjM0xMesacHfNKEyUcnxQ7mQAvIPnWwZ5e57jIZWxbhBsYb
	kOTp8j6jsVfTKnLMf0jOk5QVJA9YmdNaXjbrkQgLhGgeaUSAXJhnXaM0+xDFTcebw9yA0cmRq0W
	mKkRc/SHHyuFiXTqM1KyPIrITrupipVeJvTeESwEw
X-Google-Smtp-Source: AGHT+IF7yltF6J6bQrNxt7AW7PnCGUjI3WN32ffG9+EgVJX5LRTe+RPM5OYNXEjLvNvoEOZltexmrg==
X-Received: by 2002:a17:903:190:b0:277:9193:f2da with SMTP id d9443c01a7336-27cc0dbb137mr23515225ad.5.1758617725194;
        Tue, 23 Sep 2025 01:55:25 -0700 (PDT)
Received: from devbox.. ([120.229.24.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269800531c6sm156676805ad.14.2025.09.23.01.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 01:55:24 -0700 (PDT)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	vincent.mc.li@gmail.com,
	hejinyang@loongson.cn
Cc: loongarch@lists.linux.dev,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH v6 2/8] LoongArch: BPF: Remove duplicated bpf_flush_icache()
Date: Tue, 23 Sep 2025 08:54:43 +0000
Message-ID: <20250923085450.140602-3-hengqi.chen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250923085450.140602-1-hengqi.chen@gmail.com>
References: <20250923085450.140602-1-hengqi.chen@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bpf_flush_icache() is called by bpf_arch_text_copy()
already. So remove it. This has been done in arm64 and riscv.

Tested-by: Vincent Li <vincent.mc.li@gmail.com>
Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/loongarch/net/bpf_jit.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index 77033947f1b2..9155f9e725a1 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -1721,7 +1721,6 @@ int arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *ro_image,
 		goto out;
 	}
 
-	bpf_flush_icache(ro_image, ro_image_end);
 out:
 	kvfree(image);
 	return ret < 0 ? ret : size;
-- 
2.43.5

