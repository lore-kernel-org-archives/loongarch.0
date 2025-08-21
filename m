Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36021E0B91
	for <loongarch@lists.linux.dev>; Thu, 21 Aug 2025 12:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755778608; cv=none; b=eJh7PD1sXRklNvygTLIo8SdooKJAPfsja9u/vj7f1HbUqOKmMYpwPLcr9U+GF/FaCcryZVDJTINOvkFl3biaycEkFjfUcxxeqJfk3L/cJORRqGkE2Z68fMXo3piWFZC2GjJXnlMqaxSJHsI3xjW6E/KWytVu5CiH//8pLcPySic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755778608; c=relaxed/simple;
	bh=+Ge4iu2YV0fchUwy+7FI0t+3+SAq29n3oop3xSbvzWI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JGO4/e81eMOnajyi1B983BBaGPcxfPlNtOrUs4+jEQXTZVN7+fQCKVRe64ZemxoesdtUsRjtmnxhgYxp5U+3VGhbA0wnpKQXmElI8u2Q4hiHLJa/VijLKJA9c+ol9BP9r47h595oTwNpMtqaymjsW2NMvHDCouXEmUapUdUsTUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dXq6nJRB; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dXq6nJRB"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-32326e67c95so1081924a91.3
        for <loongarch@lists.linux.dev>; Thu, 21 Aug 2025 05:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755778606; x=1756383406; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZaBUUIcLmP9bHoHObnAzho7CHq4d9zidwzlZrh7wTgE=;
        b=dXq6nJRBS9bvoNGXXYGMrmDeYBEmycQmZNXoKvJ4gPoS8Nq+YecD7OPQhpnCtIozp6
         AR8q3Ctj2kUcBEx9p5X+DKb/FQpI+ZWSLiILz7PZGPzCQJzQHPW7o9KliFXn4y7qp7eP
         zg1DCRdg1DiRp6e8ny+9ggNyalUS84DpvdTP3xMFu30pfamvYXeZz/fzgvvg70TJHoQ5
         9dnLytujF4aN7GoiEXhv9VBNjFL8pQU0djWA8m5ZmZYzOZqtODbjbATQObXt0LPnIYZf
         DuCzLHDCrrWJDJZGOYuf6oX9q1olvolWBLKl4ung8IS8a3PL+t7S61q6V8vKVEKgfK4S
         /zqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755778606; x=1756383406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZaBUUIcLmP9bHoHObnAzho7CHq4d9zidwzlZrh7wTgE=;
        b=TfZXEASLdVkAGg1qV1jaiPqLxG5fVEV5039YNzo3gJAWwcPCB6UU0ew333FWZrkFEx
         gzqtFqYfMLaVH7YBLzq1KfO4DFLeupkWz24rMkDcVAaouqKcRUqGogNtLb49hqPw0WMI
         6tiYIYvv13Ue7QFa8k8MfMc826kauoJf0/5b/fJLi43Hz46taj3SQj+JcidnMVQV+/ZB
         wuxpKjtAjI+3P0pzOJ8gvgKqJ+goH3iDXgOybggSpQP0hQe/iKlnbPH57JffZiYkxruA
         IY07fZ8UncqA7e9VVgmojC8PTPCGpSK5vFoXRMaB+wQhnDJkn87xmB6/HVvi5rb9b//7
         XALg==
X-Forwarded-Encrypted: i=1; AJvYcCUHRqCiq4EuX+QuF7mOn2NWo7VPcWLldTk7vH7UNyH+tZBfW2Q5nN9eeCQjaI9XHA6yviYLUpNOp8g=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2ldrgwhlXDbbQ44vGKEQ7JszZ+ypQ62LcigJqfKg4rbyzJDOI
	mm6QyJsk2fWUJxrpUcs+e/A9JZglwx8uTNrPck7kBCIOCCzC1mqDvrxg
X-Gm-Gg: ASbGncuTIo8PxQagdY6tBDxyZi/ExO0pShlisEoJjjDL1HgAa4PWLcZm56So3yvwoeB
	8WxIn5PU1oMvxhSh+HmqtPLeCfgsirYcYN9dYFMwwPOEwkLNgbSLAgzTGLFpLZnWj0bJ6zOtIxg
	6MPvgWGtjoNKCY5gmDWmioC7py8+zgdagUlCWcGQ8A5mLb/6D3pNBV6/3cfMGE2xRZkvf90USdn
	bFJoqwL2AE72beS/CaXUDBSHszoRNUj1cn5kJsoXgyK3hKoAOchmXgLihxDvpaR77NCerUvhJvT
	knXLvLC9421qhGbZJ0/zrXX2XAK0DltBn4IjstAWKzDya8RlTyjWEE8diflfoXqqTLxCWkJhnVA
	RmUxZIG//7ekZHXaRk872etMR6rFePTsmRwPf2aU+
X-Google-Smtp-Source: AGHT+IFH8FEC5ecYFzMEeiHPciJ7pR9bfdLqQkdFs4MgBYMo4h3DypMts2K1Nohtel3SqaJrVEnq1A==
X-Received: by 2002:a17:90b:530c:b0:321:87fa:e1e4 with SMTP id 98e67ed59e1d1-324ed061386mr3493748a91.6.1755778605703;
        Thu, 21 Aug 2025 05:16:45 -0700 (PDT)
Received: from devbox.. ([43.132.141.28])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-324f2c48337sm1745442a91.25.2025.08.21.05.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 05:16:45 -0700 (PDT)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	jianghaoran@kylinos.cn,
	duanchenghao@kylinos.cn,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	vincent.mc.li@gmail.com
Cc: bpf@vger.kernel.org,
	loongarch@lists.linux.dev,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH 1/3] LoongArch: BPF: Remove duplicated flags check
Date: Thu, 21 Aug 2025 09:10:01 +0000
Message-ID: <20250821091003.404870-2-hengqi.chen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250821091003.404870-1-hengqi.chen@gmail.com>
References: <20250821091003.404870-1-hengqi.chen@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The check for (BPF_TRAMP_F_ORIG_STACK | BPF_TRAMP_F_SHARE_IPMODIFY)
is duplicated in __arch_prepare_bpf_trampoline(). Remove it.

Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/loongarch/net/bpf_jit.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index abfdb6bb5c38..b646c6b73014 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -1462,9 +1462,6 @@ static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx, struct bpf_tramp_i
 	struct bpf_tramp_links *fmod_ret = &tlinks[BPF_TRAMP_MODIFY_RETURN];
 	u32 **branches = NULL;
 
-	if (flags & (BPF_TRAMP_F_ORIG_STACK | BPF_TRAMP_F_SHARE_IPMODIFY))
-		return -ENOTSUPP;
-
 	/*
 	 * FP + 8       [ RA to parent func ] return address to parent
 	 *                    function
-- 
2.43.5


