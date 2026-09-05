Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5AA2AD37
	for <loongarch@lists.linux.dev>; Sat,  5 Sep 2026 09:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788599871; cv=none; b=dyV6gB1ZjcjLD/B+N+tneHi2ePAm63I8b/qDmzvoVGW43bwtiE/hcL4aBk0YbE0YmY+9yPCg//AzkmvUMFgZLKrTcd+hUWmMHsZEU34dR37faH//KWNFBxJGKEUuxE9SNfszVhjhO3Xz+SFyLZi2IuEzX9A/hKVUapibetYUG7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788599871; c=relaxed/simple;
	bh=Zvtgyg/V9eDbJuce8rlRcgUG0qD5fdGXjBQ8qLDCEnM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kXyaVI3CIJzmu0+3GA13K0vql2bVq383Ilsfj1T54rlDFjA+ftIXMd/evsa0uQjWTaFhq9AuAVtNpP2ySOkJUZ+bDVN56NHzfnR6ZmyRSief27fvC+p3EJqu6lN5HuOxBP0Ma3c2i7CVDUFDb+u6ZCk6ud/EHfQ/ejtfCx4J3sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i+e3563o; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i+e3563o"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4843e9c5960so1857702f8f.0
        for <loongarch@lists.linux.dev>; Sat, 05 Sep 2026 02:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788599868; x=1789204668; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KZUI3+FJupAKCmqenCToPHxMW6zpjYhH7gOUWlHHmug=;
        b=i+e3563oepWeIhgmArQ54DeQQ/8X5qhJPLR/SPKcNUe1hS81rGr2yOJoPF6mVB7uTn
         O2Tbun0cg/xac6rTe/s/5v7+RMGqPgEwMhXvz6uc8AXPGbLQU4liqi259bCBoCZl1vDV
         8ZootGvLyAa3XRfwIyHy11Ynv0wYI+zjXV+xQeVrsWULngnAuYIwGSTtjDtknzfNBhc1
         ZjZ1agF9wg3u/gSTuSia0sCYBDnJ1QNB7tqo5DX5puf1bGNWVOK0H2RTtvyGrzV+q3FU
         fL8ev19WJZeUifmKnRYoKNbCKGjE47vpzAowJ5oT6KhsAg1wLl0c1avymz1dfbZJhn+2
         RqTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788599868; x=1789204668;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KZUI3+FJupAKCmqenCToPHxMW6zpjYhH7gOUWlHHmug=;
        b=Vylt2zTXvFmbXCI//HdVbc87IadPDTyUv6/uvhvjwGnOIkrSTuj5e3yRYfKr4mSv0k
         WrfmHa7WqmYD+yUqFSZknGQpJ404E6TcpR1FUu/aZs+zhBuG44W+bz4PXXvUb5qDKkUs
         zKh9GjWZV/JwFU9dLjrjqJ0xgZZRh86ZG0oQ+e6X/eFqw7xHiJJ6BwXvxfwYUgT2byQH
         27YFQ63FIQzwZ+UKsmjcE+SmjukSQAnwW+jAiqM06e0dOOadfk4AxcR3HiuoKfxVKPrq
         yNknIU1F+O51tV9Zqrhk+GtJNtYFuoDwVXF+dLMeXV26GOP0W67v3YsKGHE+Xc7VuqF9
         eypg==
X-Forwarded-Encrypted: i=1; AKwUvBznMe8OhYHi2o6e/I+S66r/nM7MbBFV57501pVeBAxsyKZr8hhWRyw/DtOhOan3y/AEIFh99zllYss=@lists.linux.dev
X-Gm-Message-State: AFuF++n7HyCcY3pnV8bZSGVpODARTsV9uNWvvbiibgH7WYWe6JiqbTR/
	EuwwrukQckcrN3DS/1qlFndmuzLPqB+biTKRZDjO3wX4KsI/ipGuiINt
X-Gm-Gg: AYBFou3igX/u4CvRuvyp5U2RPj6H6y3wQMZ5tlANO7EhDQ7zItOy3EgIfEUJjIwb59n
	dRaTHBJcIxbSErYBdmOJmuXbV0KPoYtDkNMPj7OaKA7GvJfgKEIBHuyZS0uUuMP4w/iT+Q+e+ML
	f4aWiY6xurgkA0vwvuBr6zIRRp+p21tP6u5kd9lwWEEy3itKov+rx+I+UVt5b0nfMBF0uZKtrHN
	A6FrjRzqPkt2VG08P2NiIAa1DeSL+vtLmAfPGTakHdfFlqHT81LoIlNGlm2dQcJE6xd0n1g82gJ
	ZagY/toahbHwqut82Fn4mrScUpuo9kN7CV60qMvNfH/p23JtU8rue0PZ/EWVTXGb8+k7S8fDY1r
	mXnN4COO8yGplt1SVlPlvX732KlCUbVIHg8Vl4v3eML1hsI3aSWNnb8gdkWC8vpJuPS+Nu/jM4E
	qRdlANQ4HrVO8sWBrxVt7H49LlC1kBquhfIvK6ciwfTF6PugG9qCwMVoTDU/OYruCSZv0xbCjkZ
	/rqghQfLtcVfgpzIrGfxok9mcCrXSSUJQnLwqMoA9CqOe+I1LW/tx4rgOP5CwKVzzfgILLZxFPx
	QviscuAQ17P3CIEjRf531xycT0UJzd1GJ36uYazUD+9f2ppskmkqYlpwJORrXxPwh9w=
X-Received: by 2002:a5d:6f17:0:b0:485:8c16:5ef6 with SMTP id ffacd0b85a97d-4858c1660c7mr7738336f8f.48.1788599867585;
        Sat, 05 Sep 2026 02:17:47 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883be709sm12500824f8f.21.2026.09.05.02.17.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 02:17:46 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	loongarch@lists.linux.dev,
	linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] Documentation/features: Mark cmpxchg-local as supported on loongarch
Date: Sat,  5 Sep 2026 11:17:43 +0200
Message-Id: <20260905091743.41006-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

arch/loongarch/Kconfig has selected CONFIG_HAVE_CMPXCHG_LOCAL since
commit 07d5798aadfa ("LoongArch: Select HAVE_CMPXCHG_LOCAL in Kconfig"),
but the feature matrix still lists loongarch as TODO. This is the only
cell in Documentation/features that tools/docs/features-refresh.sh
changes on today's tree.

Mark it ok.

Fixes: 07d5798aadfa ("LoongArch: Select HAVE_CMPXCHG_LOCAL in Kconfig")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/features/locking/cmpxchg-local/arch-support.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/features/locking/cmpxchg-local/arch-support.txt b/Documentation/features/locking/cmpxchg-local/arch-support.txt
index 2c3a4b91f16d..127e8159adaa 100644
--- a/Documentation/features/locking/cmpxchg-local/arch-support.txt
+++ b/Documentation/features/locking/cmpxchg-local/arch-support.txt
@@ -12,7 +12,7 @@
     |       arm64: |  ok  |
     |        csky: | TODO |
     |     hexagon: | TODO |
-    |   loongarch: | TODO |
+    |   loongarch: |  ok  |
     |        m68k: | TODO |
     |  microblaze: | TODO |
     |        mips: | TODO |
-- 
2.53.0

