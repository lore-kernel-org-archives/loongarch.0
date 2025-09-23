Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026662ECD33
	for <loongarch@lists.linux.dev>; Tue, 23 Sep 2025 08:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758617748; cv=none; b=az5jKhgk121oTkhWlMRshQeWqv8kJV5Xczyo5kMV71kfbeOxdSQV9kNVlv++VLhuGXJ2ALGCrjDMiA0+LhT4Oi+dU87dGBjXkeeBsCtz7Raq/DbuLjwX+0fPBm0UGuvNuXPOn1h9+gXeSYZIL8ORXZJQvnP5+8/OKG8nsxHd1A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758617748; c=relaxed/simple;
	bh=mfRqLxrQbK9ufYnhCzdh6ReMtMnLnEihp/qs/DK77aY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q9mjk+G3ceIp+7aasErDSio8hNKbYUUX1F/om8OnXRQxbP9CPsmGbyFRGVaOQa84KQipTjh9QZZXH8FjGGXvtIbaECtdA18gFBaGC39Td3bxuymt6t98miTzgRQWAAPUTd4jP8lNm/md/32oOb9w+FmhUsbaJadHAiV81Nx1Mug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YCFvVVua; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YCFvVVua"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-27a6c3f482dso13182915ad.1
        for <loongarch@lists.linux.dev>; Tue, 23 Sep 2025 01:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758617746; x=1759222546; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2YZmDj07Ldq6nfFbWtqFrG1CWWP+54yDeybcH+1ins0=;
        b=YCFvVVuaFzz6xuspi9ujXN+W7LIoY/udLeycndtJFmXDZ5V8L1ROKLVU7+NTQ9wis7
         Gmxlx+KHD6/hJvwdikq95iauc09ZUW9eftCrxif1xRXvvqWodIvde37osJHez6aP8cRl
         XDSPWMJXycFl1MKP+7zG/RsA2n4DLbiDp3u3GVoXdo5jk4vrOCH6ep9xu5A0KmDVtFin
         NmG6oYp9Acnjcv6p3Z1OLj4ewnb3DbB4nJmlqJOjHJyOQnG8/hUq+numeQyrWC/U+vLK
         REYtFD7YWmhKkzyqwOSn86qZBazpQ1E7G8kw3Dk3PwyFI6dnY08akTVWTQ1M0oWtvgmu
         L1WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758617746; x=1759222546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2YZmDj07Ldq6nfFbWtqFrG1CWWP+54yDeybcH+1ins0=;
        b=BFIi7BzgXPp/+89KqwcYq8VB28ejreqHxWu9zp386dxrS4CA8KMi1EcxhfpFzFWmIj
         SlBpW77qpqn6cbVrFrxxhyagnrjTc3eT9WPN12pATqtlDzaPj8mSJdfqXWa7i2dI1+tN
         7fpt8tnJ1fL0JjXNhJOP0EIcyIVP/MdKYe11b9zTZENjTS6Ks7JVfK5g6Czn0i9DfTIX
         oaoIo9Yc9rbtqEU7cSRYKqhIa5NRleeRL7N458kikGAQA11dBjWdfnpqpf/3jdPcB4dN
         LuGTZfUpdoVt0kEWsXN/OwDSPbm76AsJ6kNfAAN9QDI95M8utk7KRAz+MWwconSmXVGY
         R5pw==
X-Gm-Message-State: AOJu0YwJNjD6OHBukaAdMOcjBOpfGdAS2nbVcktUYQSxttICKyAPX2Sc
	yAR85kq4CcZYMWoiIKr53zv2+WFEpeGc4X3j9E9O8WhdtkiyPdYXlViN+OMZbynSLfR17w==
X-Gm-Gg: ASbGncuaH2SS17YdcprGYH1yNE6E4BidljkaXEk/Hbyd08Orh35AhFLzk5hb66fKTc9
	c7Y4UhhVyiYlT2aC3GqMac8LrWHyppQ9CetgkIqP5IbHVPS8NZwhi9P02FVdEcDXG5ONWvoMu5T
	X9L6SIKxQqHe2CWbKe+A/Wkjg+4NsUl4ZVIK6lDWImzZ6mAI8OpJJi+IJFhzFFjBrUoxTUYzu2r
	EkwnO9VH/bpqcCDpsEVPnI8be8D275+1RO9nhMvXHiwjUMXwjGJAghjJhk4BZ/RhuEwtNZ+AGtx
	SbJToomaxmLs9QbITg5PxUPVV3mR94kfYPtkfapGtOgte/qPkNmZZZV1jyKt5N04IIASeyD3vNV
	wd3alwOESe2+EOAZ1BdE6e+E4iAm0SQ==
X-Google-Smtp-Source: AGHT+IGnEV7xU40L9N5rI2X9oYMiH8YZWH/3lyh9KpilkgtnWgdGxsYPQ8fAJI2TQfcDnh2FkH7THw==
X-Received: by 2002:a17:902:d487:b0:27d:339c:4b0 with SMTP id d9443c01a7336-27d339c059dmr16281865ad.35.1758617746391;
        Tue, 23 Sep 2025 01:55:46 -0700 (PDT)
Received: from devbox.. ([120.229.24.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269800531c6sm156676805ad.14.2025.09.23.01.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 01:55:46 -0700 (PDT)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	vincent.mc.li@gmail.com,
	hejinyang@loongson.cn
Cc: loongarch@lists.linux.dev,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH v6 7/8] LoongArch: BPF: Make error handling robust in arch_prepare_bpf_trampoline()
Date: Tue, 23 Sep 2025 08:54:48 +0000
Message-ID: <20250923085450.140602-8-hengqi.chen@gmail.com>
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

Bail out instead of trying to perform a bpf_arch_text_copy()
if __arch_prepare_bpf_trampoline() failed.

Tested-by: Vincent Li <vincent.mc.li@gmail.com>
Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/loongarch/net/bpf_jit.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index 07ca32c673d5..6dba407c202f 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -1719,7 +1719,10 @@ int arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *ro_image,
 
 	jit_fill_hole(image, (unsigned int)(ro_image_end - ro_image));
 	ret = __arch_prepare_bpf_trampoline(&ctx, im, m, tlinks, func_addr, flags);
-	if (ret > 0 && validate_code(&ctx) < 0) {
+	if (ret < 0)
+		goto out;
+
+	if (validate_code(&ctx) < 0) {
 		ret = -EINVAL;
 		goto out;
 	}
-- 
2.43.5

