Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C2317E0
	for <loongarch@lists.linux.dev>; Wed, 19 Mar 2025 02:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742352862; cv=none; b=LfRNB1NjZ1jtVnTjmI9WIMJopcWa0bArm0V1cY7cGsQZginRXoEhRhrHrc3Y35p5IOPwFlVYbKcBI+U/gjnf9zd4CCTqrDhpWlwqy4Xzl6bQuJMUJHIZ3Mx7Y+jkbeP2a5SSioXjhJvGo0/TpApRmrHFcZQrpJFoGj2I75lAUBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742352862; c=relaxed/simple;
	bh=dKN4xjY/HkeBbjfZnhzsdYX4yrkC2f8e+I8NBbNgDEY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=O00kxNgA3rD2yUzAk8MS3KdXloFKVIqnsPAegM6MM0D2C/XgRKL12FmsRHdANwC1Zk5mCID7GRg6KvA/SU/9Smk02BhuFJt/adSml7cjOOR+F22eDu2u2h/nrcFttbu0kcMR99oqIBy5u/NZu0RUn/6kwMV5W7EPgSeOQ4VedEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I/vR9Vpk; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I/vR9Vpk"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-223594b3c6dso137122005ad.2
        for <loongarch@lists.linux.dev>; Tue, 18 Mar 2025 19:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742352861; x=1742957661; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ek7cme2/eudsEK193BJL90oVx+fNXmIhOoJyqv4zYew=;
        b=I/vR9Vpkv/PF3tKhXeqf9EC8xsf7eeoVfQMtixdMn6RS6qtp/vznbnd+r2N2B2IgRZ
         MO1v3pNyEAE2XuDRstnovIWqhl6s45XjOdBTzYAeoTO0Ks/rWkso4JcjVHHYQ6NhobaO
         rmjzADLPFw4vTqbWORpoXGmcpZJXVfziOR+fU8+REtAtDgk3phz6lln6Y9l1qOIbtAFY
         6q9tsrl+4AI9oifWIWWMiqm0/LKrSiTb0PeBQwgSrGmgGVa4q1t3LMgtiTBBi2PGC2Or
         fZx12GsOBEliDH1U3tlCxJsSH4q8hVztJrZZJpNXGLD2yL4Xf/8IP/L93H/i+12JVqD0
         bmZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742352861; x=1742957661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ek7cme2/eudsEK193BJL90oVx+fNXmIhOoJyqv4zYew=;
        b=Cd5O2kh5YoS6Uu5h9iXDN4iKRoGsWGh0KKCqH3Go9KpTlqqGkT7MLJf5zwygQ0k+jX
         s/AVP+jjLWLwD/ROHrs9HpfoAJdlNNlA7+jAUhhkNv0PDxupCbYKMwhVYlzBmAYkSixG
         ot24e43NfHNl5/OcaHmanbTH1soq8BF/YyelK1ymt3iecGinRMgRjNxX+4UUcfj1EsFW
         vgHs7JWVtlgUP90uQpSN3vb3ZxU7J+CIY1Cm/yGVaimGCipel5aAnSnYgqZ/D5T+O1ro
         rkkjOr3hu53v8XpqlwkSocoCiMEG5YMkHln9wKg1GWW8X/QrPKnTt96JT8pH93atPoMx
         JSWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWP8wMyO/9kIJ9yeucHC/6EvSdqxV0VpkoDj9yzQIveMlPqkDVd+w50IN9XxEHm7fuoIt0QnmuPpzM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyWLgBTiAQ44G+L2zId1oiKdTmE7roxPXLv1NSgLo58e2Y3lxi0
	0Q7TfunWalKya8o9VNN1HPuH06g0YPmfPyxBxLjSW5Of7CUT+uir
X-Gm-Gg: ASbGncsM8jzXKsx8l3+IL4xiV429DihYfbh7LNUG7oR5ZHxe7LLCvaORaZHYKaRJ82h
	j8CHX2cI8p/LYMWKnUxJYK+nVVk9NP2Ti6XshI49hIvYfwyMVDzrR+NfOalRLBvTQkM2fe8n5Nt
	/8V3iMedUpgGFqQTM8Oeh7xragDdQUzO46DjuwOdpKvV9gQ9NrLmvZ4Tslqi9Y/g90j3/9WZ4Dw
	ezKzDs9DaKYlCtfgiZfI+oIElVxbcJdZrf1mcRgW3cHt4beN+wyS5m8p4LzMc4h46W7g86/5Wgk
	mZeD6/u9XqkSPzwxnMO+m8Jtpz1A6mkOLAWonemb5ZfvY3VY5yX8EIs/ly3wxDIX5w==
X-Google-Smtp-Source: AGHT+IF0dfIeVetmSPcgsPVe9LLjyiIoUyu5s12IyD3+OHyJqEQkUDfF5BV0koR7p2kdcOfRbFxjgA==
X-Received: by 2002:a17:902:ccd1:b0:21f:5cd8:c67 with SMTP id d9443c01a7336-22649a47794mr14215185ad.31.1742352860696;
        Tue, 18 Mar 2025 19:54:20 -0700 (PDT)
Received: from localhost.localdomain ([114.254.9.37])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-225c6bbfdfesm102978775ad.203.2025.03.18.19.54.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 18 Mar 2025 19:54:20 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Hongliang Wang <wanghongliang@loongson.cn>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com
Subject: [PATCH] Loongarch: Fix device node refcount leak in fdt_cpu_clk_init
Date: Wed, 19 Mar 2025 10:54:10 +0800
Message-Id: <20250319025413.67014-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing of_node_put() to properly handle the reference count of the
device node obtained from of_get_cpu_node().

Fixes: 44a01f1f726a ("LoongArch: Parsing CPU-related information from DTS")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 arch/loongarch/kernel/env.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/loongarch/kernel/env.c b/arch/loongarch/kernel/env.c
index 2f1f5b08638f..01aea44cf4b0 100644
--- a/arch/loongarch/kernel/env.c
+++ b/arch/loongarch/kernel/env.c
@@ -68,6 +68,7 @@ static int __init fdt_cpu_clk_init(void)
 		return -ENODEV;
 
 	clk = of_clk_get(np, 0);
+	of_node_put(np);
 	if (IS_ERR(clk))
 		return -ENODEV;
 
-- 
2.39.5 (Apple Git-154)

