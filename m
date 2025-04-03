Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0ED2505DA
	for <loongarch@lists.linux.dev>; Thu,  3 Apr 2025 14:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743689492; cv=none; b=IQmc0kYot6aaXw7A7SYTFgvmJXxHHjnPoHSfM/EXCyJJ86SRMM0CYVE7Bib1M0dtPhlczdpj3n5pZWzh5iS4PtmsP/CAR9YidQh8yP1afXzlFuW/eOqpCZZxTAr4RX0sLSYnZxQxHKYFcJxOzzpv0zzmpcVviExWOrspVjewSKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743689492; c=relaxed/simple;
	bh=RGHJTQze7kvfvQj1ObUvTp1kIBQZdW9W32EHMDx/fp0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c56Y9ATrSkT+MLPuv4x4GsTTdTicSo9k3jVe8ufpJQIAU4fxD/72Sa4VCstEdx3IRPN5BpWlgV6mERcfmDN/6dBbZ3YruUsIiWcLmRtiYllrproqDqAGQAfL6V7DeXdfvfW7tkap6g5s3u1cHQJpctkf7FJY2zToAyr2i0YvNbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=WkL9Yvd1; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="WkL9Yvd1"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-391324ef4a0so129556f8f.2
        for <loongarch@lists.linux.dev>; Thu, 03 Apr 2025 07:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743689488; x=1744294288; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K0VfW05t/iqaQhnmWEi7FoyTUAy7cc09x7Pm7VnpG3Y=;
        b=WkL9Yvd1oyaU/I5KOmTbQm+GjBe+Iwfd/whWAV6T8R3l4pdqNsCTzEhhPp0QOly09x
         mx7GKcHC4WrtYVNcuF06uVhOmyZBLBWpeinYWjjoGHIPoOwOolxUOUww89RsqssY0/V0
         g1uHczW91bAhaoaVn+XuHp7FcHBlMs3sEi1yBF2Bz8kdbwnH0E/ggGBGbXKx9ixhPYq8
         IZYcygttyhaVnuX/YVFPxdX/PIb4MqELNtkhpWSrW6AYbmbR4sKZjHWu/RK706zbN1po
         fB+fuxSWBfvdzZh+vx7TBmNaGVjMDHq+rvtv3gqTo5H72veeUeCQkZHQmPrri+r4jElH
         mBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743689488; x=1744294288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K0VfW05t/iqaQhnmWEi7FoyTUAy7cc09x7Pm7VnpG3Y=;
        b=oUg2i7plWRUMyfNs91dswMKjM6Sea5Jwe8In+/fu+JiXOCWzULrSw5fdIL+rsJhW4m
         wilswh2L4Fs2zS7rUi0Rd8jRJEMtYTWvl0USV0z5SLpkolMXzf9is4s3McKmEMWX/rPj
         DFbhcEyBdbXZPMecusSymgzFMQfvTI/bC4jCCnnjeYl8uOoEOWfq3XeceJizkiAf6rDv
         GMm19c8mbLvdLqKy39TA9TihAAAQ77NbQ/sAH01STyRX9Ejqz3e9VLiZ3rYXzdsyjAwK
         GMq1rGaJMXgaJzMnmsmN83sjcfIPaoavR8bsF+W4RMFbmjGA4Dsl2h9abhkS2ryAD1DH
         cbrw==
X-Forwarded-Encrypted: i=1; AJvYcCUjc3RjclsqeXo3DBZZ1ygaTWSbNPJAUp2ay8kv7WyJ8SSLhEOANqPZVxZAD5nY1zsUaOU6tCUwkh0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzYXlqziA71FQ7acDGx0hFik//rHge5A9i910017sHO46nHc+ar
	UQV6B+Zm7bk92N6ab83Ph7o4gkb8seEyj/nQ6UjjZtwh0NxksCWkGtH9j4zAJxs=
X-Gm-Gg: ASbGncsnJDFNXVemAoRqordbhUbchCud24yEx2NnnGRK9S4JKMFrA1y2Rj8uSsZxP6j
	IUjyO3IwNrF7wlPoEBgWtBTyio4X+PbPOD40VpzWaRdeDyeWwjTknfmiM6tsoCkEPv7nT2iBAMH
	0iJAsQ+CBwbqEye9PLrEzXpVlycvPUvAq+TpW4vgqMGj9KMfIwecWIijl5YnFIyYmtDSil+deFz
	g7g7ekvIIMTTR1Hq0rCKHmAUEAOjNXmL9lPXqVK5OUkn8tRgGZ7knB79lOeXiLs1o02bHQgZtuY
	kwwKDVQBHJz3AZKGmNbdIITlzBYolAvsnQ9Y5UW3BYccogPprhcmmvNm6LEKpSic2tyLRPOvxs0
	OIhEJIisJLyLqwLGFeUQL7b9H9nxJCkx/1zY=
X-Google-Smtp-Source: AGHT+IHiffo8Q7QbwNeKM3hUk+/mFfPZfaoRh6iLXZTeYovOPnPhwX5QouFrxPFyA5XS+S3AtKDdew==
X-Received: by 2002:a05:6000:4582:b0:39c:1401:6ef5 with SMTP id ffacd0b85a97d-39c14016ff2mr4608687f8f.2.1743689488137;
        Thu, 03 Apr 2025 07:11:28 -0700 (PDT)
Received: from localhost (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c301b6778sm1853301f8f.46.2025.04.03.07.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 07:11:27 -0700 (PDT)
From: Petr Tesarik <ptesarik@suse.com>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Guo Weikang <guoweikang.kernel@gmail.com>
Cc: "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Bibo Mao <maobibo@loongson.cn>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Petr Tesarik <ptesarik@suse.com>
Subject: [PATCH] LoongArch: Remove a bogus reference to ZONE_DMA
Date: Thu,  3 Apr 2025 16:11:25 +0200
Message-ID: <20250403141125.271047-1-ptesarik@suse.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove dead code. LoongArch does not have a DMA memory zone. The
architecture does not even define MAX_DMA_PFN.

Signed-off-by: Petr Tesarik <ptesarik@suse.com>
---
 arch/loongarch/mm/init.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/loongarch/mm/init.c b/arch/loongarch/mm/init.c
index ca5aa5f46a9f..7fab370efa74 100644
--- a/arch/loongarch/mm/init.c
+++ b/arch/loongarch/mm/init.c
@@ -65,9 +65,6 @@ void __init paging_init(void)
 {
 	unsigned long max_zone_pfns[MAX_NR_ZONES];
 
-#ifdef CONFIG_ZONE_DMA
-	max_zone_pfns[ZONE_DMA] = MAX_DMA_PFN;
-#endif
 #ifdef CONFIG_ZONE_DMA32
 	max_zone_pfns[ZONE_DMA32] = MAX_DMA32_PFN;
 #endif
-- 
2.48.1

