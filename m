Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D811D37EFFD
	for <loongarch@lists.linux.dev>; Wed, 27 May 2026 03:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779852584; cv=none; b=qL49+OPNgtb0q9Ihg2bPkQTdtkzHMDDcmfSFgDNpE4NuROvTEcY4wBUCPH6bINA5f2bjU18x0mMRQBb25S3DiMcdgEBdLRqKCvXksXaXr/5Kn8R415yW1KdR2YYi520Y83C1PZQ4Cl3jlhU6Z2CUfTJSFa16BA1GvfAEdL2gXcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779852584; c=relaxed/simple;
	bh=OetecSVWSHSGXKbVApct5VtDpZdb+yRma6A6pwugszA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TZbHsoK3gkVGnppkuJpFCxcvwIeE0zk2NrL0HOLxqCpjvgPc96rpmEm1rXhoWOVuLdC+zH8j8eYI1wB2CAjDiC4cApGOmdO1ppqukiEUME8X0Tvr/xIRjkTEVSakGJvGoT5ptymsf8SNr7reZTsboH4nvrPUsH3ucLltvsC1W8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oQ5niEaa; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oQ5niEaa"
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-83975e992e1so4531590b3a.2
        for <loongarch@lists.linux.dev>; Tue, 26 May 2026 20:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779852581; x=1780457381; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=osub7jqB1KkbojdE6IP/r6iEAlyJyU/eaCe2RQB9Q9c=;
        b=oQ5niEaaIoTK4Eq8IjGuddauRoTJ+Vmm2g4fhE6ebPfUKId768vxuFMvBsQpLzkm3c
         ksEyAWVXQWB6H77yhhLH6SFOM8dvcNv++HaF1kCvWh1SegF7Q3SJSoqj+NI7+jT0NVRZ
         fwV1ay9oRSWxz2RiiYevTThAmOVxkHGQowvWS+RLrzK1j402S9uGArbt6izcp9zn0bDI
         6XuOjU52ETHS6jV851Bg6fCsC0E6/lLEnO5i5ba+DesewjrwDPJk2VhVI5WxnGB7K2sI
         rbaj3Ti1WuGMOUq2L34Jo3RKV2sY2v0xSltcZ1Lslw+cgy+Mk+bKPN3DEF20wgj/UoFn
         UatA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779852581; x=1780457381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=osub7jqB1KkbojdE6IP/r6iEAlyJyU/eaCe2RQB9Q9c=;
        b=CIXrutlbo02oBqcy/e7FC1cswaDc/4U791UAhRYPKgOERAbPICs37AFiEWjUwGzuSL
         h0ClWTl8YKha4mZZiCxBiPlywfq4jqKiy248FzUut7l9doHBCfLRvWNBko7rIQSh7z6g
         fnZwXy18+Blsgt+LoAFe6d3dW7CRGEnbAgDv2x8KgR0mGA5V0iJvYOZOcpMQohTyJJEJ
         P0A57fzkesjZSB0fHwSSGKU5wbC479AEqSQoMewj/S2AiIjUPvMdQA5Q8hQOke2eSA06
         CqmRo2I1jadvLd7cZE8qB3xlv/t+kcpWc3hHgwMOibTKW8Ztm6saHgvmkB+4PCMlHZWw
         iskw==
X-Forwarded-Encrypted: i=1; AFNElJ9QATVbnZa8QwIalxVhIMXBRIzn/7SQif/4OoQH4JJc7AmCjaksRsRnNDGhPcng42awbzEC4wYayBE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxtZFm2YYs79ZKppfktxfw3RUtZXNW4NhJl310wrWeP12shVeHI
	efeEnFTb7zRwUyTXYU/pzGXvp660ftmaSGbGP/iIIS2HxIseJBoiI5YW
X-Gm-Gg: Acq92OG7AcsWrN2QxtLhz0qDEyjdWn3F6qSkbkNvwhkHX75SiPdOx/8MnKImvPt1nsh
	b0G30BohZxuZAzSafpcLaQ2ZJnuk4GZvs4rPVSbmAlsjURaGXOqd7nXsBj5gf09kh990VqSGYWV
	rb1zC5dlXQkaPv+vPf+T+ySLIlOFwrqeuienJlKG+/0RmiF/zvegdjuMlOaWspcgJT4qCaCNyiB
	Gpq4VZmiywnOO9+I/rixNhc9v2AV7tC4XDvTHZTj4NIFIMcv/Do3fYX6pdecEahJ1RwLuU0Do4R
	+cX4jxEbB+2U2MYXFFdUafPsBzVd38GaPwTIMFykFVw5PA3iImuI8octTOuVgZ82Xm0oLeFCCOL
	YteF5dEYVrbrXCEzhX6PJaARCuc50dsrFce08Cp9AEMPO5X/uSkkdA6D+OjLFWyYTgRGRtiJwTI
	9naAna/em5AdMKK3DougtE5Q8B0vNAClazaGRz
X-Received: by 2002:a05:6a00:7702:b0:841:dc7d:306a with SMTP id d2e1a72fcca58-841dc7d511cmr264256b3a.25.1779852581229;
        Tue, 26 May 2026 20:29:41 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d7307596sm749688b3a.59.2026.05.26.20.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 20:29:40 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev,
	zhaomeijing@lixiang.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	bhe@redhat.com,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	quic_obabatun@quicinc.com
Subject: [PATCH v3 01/11] of: reserved_mem: handle NULL name in of_reserved_mem_lookup()
Date: Wed, 27 May 2026 11:29:07 +0800
Message-ID: <20260527032917.3385849-2-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527032917.3385849-1-chenwandun1@gmail.com>
References: <20260527032917.3385849-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

Prepare for an upcoming change that appends /memreserve/ entries to
reserved_mem[]; such entries have no name.

No functional change.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
---
 drivers/of/of_reserved_mem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 8d5777cb5d1b..313cbc57aa45 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -788,7 +788,8 @@ struct reserved_mem *of_reserved_mem_lookup(struct device_node *np)
 
 	name = kbasename(np->full_name);
 	for (i = 0; i < reserved_mem_count; i++)
-		if (!strcmp(reserved_mem[i].name, name))
+		if (reserved_mem[i].name &&
+		    !strcmp(reserved_mem[i].name, name))
 			return &reserved_mem[i];
 
 	return NULL;
-- 
2.43.0

