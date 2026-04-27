Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25D63B4E94
	for <loongarch@lists.linux.dev>; Mon, 27 Apr 2026 10:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777286868; cv=none; b=euvKx5KXRU/zGxOHX0KQQHWfDZRlQlP+Qw7XlyfS5F+XcPdNRH059jIr2KAE4ZN5oj8Sd2EkhCUEoFvlsJPLp6UNEvmOUduYWnqhctKnnp2sT0qwbNNwdICniCnlWuPj+uSyjeCT+PxOdVTDON/3lriEZKSH170Cum4mMRfO+wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777286868; c=relaxed/simple;
	bh=AFxDVPfqDD1fX+0U3m7t2OJUKJfWgyTTwFDtosrykxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vF2Hlv7nQmJN+f1N7jAXurWPHTeEUHv+46OPyldznlusDLPet/Uf+9yDGHyb/5r++p7dnnl6F2gWCW3lfRa5MKg9rx5YsXO4bJfsibvGNetNEk0iAKRkSaIJDmxtR2u+k1FGps5wM1l4wpIgQno0buk96gYHGA5p80vvFG/DwF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc; spf=pass smtp.mailfrom=hev.cc; dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b=Tdr+p8qJ; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hev.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b="Tdr+p8qJ"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-35691a231a7so6660417a91.3
        for <loongarch@lists.linux.dev>; Mon, 27 Apr 2026 03:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20251104.gappssmtp.com; s=20251104; t=1777286865; x=1777891665; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s1M23bGh5Hxam/8XaoRaHHo8c9kozCZBAlQpB9hznRA=;
        b=Tdr+p8qJYUxAHhMmvROltLN1Q9xL63NWbH33jVHbLDqve8k6HslQHHP1wxpX5fFvvR
         g4byqOqg/I3hGC862+ItoTyOGWVh3xmMU7LAXjDGbHSgzVpjDB/0xtBHA/VjLY0v7Cep
         KuMsZJJqkSjWDCPE9JhMBB/1EW/EQiNehUvJnVJgzasPvNLCBQIHhUPu6vNutlMrJSNd
         3WxTqRW+LaJPBI4B3pi7XKvVRwkv+Zml7aVI2EMATpg5d0ODijFbcxMJ1Lnf7susVluq
         S0rsTiDGx/5KcQlQKCY5pPVZv3cJ9HHOzSxoAojvymJEoWRh03Lc4MlAbn+QG0UhV3pE
         3dvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777286865; x=1777891665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s1M23bGh5Hxam/8XaoRaHHo8c9kozCZBAlQpB9hznRA=;
        b=rCtfC6XW0RLfHYgbJKGfniYbQV4WMGQ+NbY3IopyPdyYsjKIhTD16wy983q5w8j8T8
         GC4n7rGJ5zCZmIhTkGclnT2n7CymXCiLt42iihoh1QDwS1qMMzsixKfG7UD3pMp8Hls/
         lm19pzfCz9vw2CIY/ZBd+PKKa8Tb47TDd7Csc0OOzWoCxXft1Xjay/WQrMrnDZnXd6NQ
         YH2/jwo2vte9WOCL7a5SwJCNC/qVyaZKkLUg5wVK8OKv4R0TqMNDM+/Vo1aRXXr7S8Ba
         s5WX+ZLBTmPGKcgo3C7fa6fT76tT+Vjf5r9lTJZBnR25ikGDzMwqU07yJtTdeZhqH41r
         ocGA==
X-Forwarded-Encrypted: i=1; AFNElJ9/Wq0kwuFNZytAvFUXnocKTKPO+zsIDbwCoEbzC/QSwNxkqaDwTpmP9fgVQbbNr9xYrcfVajil7GI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwZOpM+dICqLyVMCEzuykLQA5ps2/XOxYVErDIBtVV5Tlbnezpo
	p0llyV8wwUr8kjN71LHdHgHjOIeTCwSkVzwBDLg/fIYbdOTdDji671gset5WNTSioCQ=
X-Gm-Gg: AeBDievQZtwaIRkCoo7AK9tQuAXjsnnjxQh/A4OnmfdqZ+HI7HbTF2d7MhfXLEJhRfd
	ak2w++NTDd8AIAGYHuLvukqOzX8i2QwroBkE7G6f5GZiLAOgmoQ06qEM0KTilt0VJUDIKh/ryMd
	+R5I+Geaq1dZkdOijv8L95Jv10wINCogpan91zRqAyzeEmSGGFUu+YudUqE0nSGDP6RK3gGzJSK
	Yw43eUch4KjRFY0g2xkbFm3XbqX3yfnDZ0AIKHEUeKL9iKfFvPN2ZLanIyRGc8ZVHO3nOajZ6mB
	Wo3jvpxdpIg8Jrwt0pf6lwylUeci7Fi67FzgUepy7V8RAlparrZ7+enilCJb5xega6mtSRjnYU3
	z7X1g9bqNB3gnk/Xi6FzcWX7KkpYv/VpxNPY5ouAVxf0t/5qwYAPCTahXWtJR/pVaaXhZ2Fpg6z
	GP8+I36pCpLWwEhejDSM2XkA==
X-Received: by 2002:a17:90b:38c9:b0:35b:97ba:acee with SMTP id 98e67ed59e1d1-36140465451mr42503043a91.17.1777286865144;
        Mon, 27 Apr 2026 03:47:45 -0700 (PDT)
Received: from xpc ([2400:8902:e002:def5:7882:53a7:6a48:4d11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-362dde4ccbfsm16227029a91.1.2026.04.27.03.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 03:47:44 -0700 (PDT)
From: WANG Rui <r@hev.cc>
To: Huacai Chen <chenhuacai@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	loongarch@lists.linux.dev,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	WANG Rui <r@hev.cc>
Subject: [PATCH 3/3] LoongArch: Skip relocation-time KASLR if it has already been applied
Date: Mon, 27 Apr 2026 18:47:21 +0800
Message-ID: <20260427104721.47724-4-r@hev.cc>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260427104721.47724-1-r@hev.cc>
References: <20260427104721.47724-1-r@hev.cc>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the kernel is relocated during early boot, a randomized load
address may already have been selected and applied. In this case,
performing KASLR again in relocate.c is unnecessary.

Signed-off-by: WANG Rui <r@hev.cc>
---
 arch/loongarch/kernel/relocate.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/loongarch/kernel/relocate.c b/arch/loongarch/kernel/relocate.c
index 16f6a9b39659..c36604a81d08 100644
--- a/arch/loongarch/kernel/relocate.c
+++ b/arch/loongarch/kernel/relocate.c
@@ -139,6 +139,10 @@ static inline __init bool kaslr_disabled(void)
 	char *str;
 	const char *builtin_cmdline = CONFIG_CMDLINE;
 
+	/* KASLR is performed during early boot. */
+	if (kaslr_offset())
+		return true;
+
 	str = strstr(builtin_cmdline, "nokaslr");
 	if (str == builtin_cmdline || (str > builtin_cmdline && *(str - 1) == ' ')) {
 		pr_info(KASLR_DISABLED_MESSAGE, "\'nokaslr\'", "built-in");
-- 
2.54.0

