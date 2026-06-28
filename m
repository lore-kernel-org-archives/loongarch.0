Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B103A874B
	for <loongarch@lists.linux.dev>; Sun, 28 Jun 2026 13:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782655142; cv=none; b=CzoyyC13gNpRLE9aiY9rL8WAzH5P1osEBWH/Kj5C1MeLXiqSx3wkvA7bWbP/wsJVv1kvJVc5GzufFJiHDdHuoCQ9doFtzBSb0D/0O65HkvK2HHRpdKpei+RYsUpNUbeVvNLlXhKsV9p/HjqUU/B97l4udEflQEIk+KzaF9Tu4xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782655142; c=relaxed/simple;
	bh=SrE9GdkYuOeg5Rey8Z0dC3h8OPhVuqw7jocoVWuGV9w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F8WJbep5sV5dghETHuClob90wz6OHMyKNFPHpebgvjEic+kzf0eq/1P1UgZSM33le0BqmFn8ZAaAhvJrDAd+1vihBo0iAUR7NQhQUhYVJcZHp5ecbxtEay2pYAIpxjNm2Ez0eTJfVizrjmfE2nyyTv0/p9kAWDy+CFMXs7h/NQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JsmLnDbS; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JsmLnDbS"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-845dc38ad4dso599080b3a.0
        for <loongarch@lists.linux.dev>; Sun, 28 Jun 2026 06:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782655140; x=1783259940; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jqXn/X0N93kvWkJarTQhoPtzUbI801hVn8f9o9OjVHg=;
        b=JsmLnDbSsPwj3aX+He5Tz4nNL2Qirwym+h30lR/OJWw9nmoNV0UOvlMk8PZAdU0rRZ
         kH0KR89IPb9TsR+9+4Dlq3qKsLhKhffnRErFwZV7H9VGyQMJR4Yfx1VF7Z8eyB051zbw
         gWvHHbRvfgx3snkWOH3rNUW1NmBK0yzS/9oDOwJRiyRZ6+HTL3LT3UXvBDcXwG8XKOc/
         aaPeEFAFCJihr38/7dDZwnsoMkbXQPJnkQbzpDcSi3tmMaT8z2+O8qaUlrn8IjH7HvkC
         d9fBIezzOKx/t24kwo29O2TB1l9VMAO/LLg36Zw6hDbYSALGOFDa//nzIHp2vWxYV6Gd
         +vkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782655140; x=1783259940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jqXn/X0N93kvWkJarTQhoPtzUbI801hVn8f9o9OjVHg=;
        b=SN+tjyNl1jBu6NpJJ1zw8j4F3wWErRfc22vNiDHSCQkhq/i42GFN2f9DL7oFRiYZLX
         Kq/kNAt5SNtyq6w6Hj3FBDpBi3DNyJZdUsUocDGUDu7YzoYJtMXCHNT967Ty9qxrNAmq
         rGXAmDNteRLIIyqmdAkkafJR3qsL2Mw1DbtoLU5ltkWIOWz6RUclvsw8WfwMttqeOUnt
         JfYEZzd65ldAJs3DIWPbCemlCUjnSMHRVWOlmjDMbp6SMvedP4lIqxnyUzqszvo2SVVJ
         EfDmXS1qFPmBBy8LPaGFalreMF7IlyfrWQCvGvGnBBtzeeZKCqW6UurUz6+mkFCxmPz9
         BdLw==
X-Forwarded-Encrypted: i=1; AHgh+Roo+Ts9qjDZb37vZbOwRamKvLX2bX2MR/16gdg2IK24/R9i2mIRBQeTVSQ286qrt12KVkAWlEVUNds=@lists.linux.dev
X-Gm-Message-State: AOJu0YyoLWg94qQhqarkRKjRzcOnCxJwFfzOjYVvxAQNnYnGKtU6v/Fh
	4Ck7AAaw5oBwwEIUoFUTlfkeqsOsLubNKjCgOOQrfkFWQwafTiHh18vI
X-Gm-Gg: AfdE7cn/ngEsFDHvfIsTPLvkKNR422MUqTptmdrXLfyQT/K4vgsma+E6F7vLInih05A
	N0O3mrzWaZ53GiqVqmgIpMbemOBc7ZrEeITix5zNFlZpRaJZ9P6llwL8KmeUdlGka1I5KxPen9c
	BhRCi7s9GzKd7hSmPrGqGRAlJ4dX1zymKfctx1DpozN3JJcA/44CsjOrAyeQu2yxuCQkG7qtDHA
	8qIktR+UHibiBb5itvZ6dWoOoOOTl7YNaKFAgp0l+Vm0k77X5/T1PCqIvtK0WgebzfYc08kfZ/i
	6aLSH3S9SQWj0u4pAjbeSyV736bqwrJ0itZ9pJihc3rCZckw4MkyWP4GkdN4qhiutRFkGkIWDdw
	7FUcDmks7fGp7is/0bn/yRtoRGO9r1yVVjoEfly+gP7NLNpM2Y3suM9YhTbRdLt0KuYsD8Dc5cY
	zAbEQIhzw=
X-Received: by 2002:a05:6a00:22d5:b0:845:d274:bfa6 with SMTP id d2e1a72fcca58-845d274e54bmr6642491b3a.61.1782655140282;
        Sun, 28 Jun 2026 06:59:00 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a40d23d7sm10041108b3a.30.2026.06.28.06.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 06:58:59 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Sang-Heon Jeon <ekffu200098@gmail.com>,
	loongarch@lists.linux.dev,
	WANG Xuerui <kernel@xen0n.name>
Subject: [PATCH 6/9] LoongArch: remove redundant numa_nodes_parsed node_set()
Date: Sun, 28 Jun 2026 22:58:20 +0900
Message-ID: <20260628135828.1393120-7-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260628135828.1393120-1-ekffu200098@gmail.com>
References: <20260628135828.1393120-1-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

numa_add_memblk() now sets the node in numa_nodes_parsed itself, so the
caller's own node_set() is redundant. Remove it.

No functional change.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 arch/loongarch/kernel/numa.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/loongarch/kernel/numa.c b/arch/loongarch/kernel/numa.c
index 8b89898e20df..c96c53623715 100644
--- a/arch/loongarch/kernel/numa.c
+++ b/arch/loongarch/kernel/numa.c
@@ -216,7 +216,6 @@ static int __init fake_numa_init(void)
 	phys_addr_t start = memblock_start_of_DRAM();
 	phys_addr_t end = memblock_end_of_DRAM() - 1;
 
-	node_set(0, numa_nodes_parsed);
 	pr_info("Faking a node at [mem %pap-%pap]\n", &start, &end);
 
 	return numa_add_memblk(0, start, end + 1);
-- 
2.43.0

