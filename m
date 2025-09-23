Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1242B31812F
	for <loongarch@lists.linux.dev>; Tue, 23 Sep 2025 08:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758617744; cv=none; b=AUCuORKpXxP+lLLdmrouTJQgwYz4/piT1r1ALLCAlzsCqxEhUccc0pDfhWdlrBTNw1erG3A+5N9w2wPlOjAi5z4vcWfeNsCqujamY+7PeH0a5Z+vHKd9ow2HLw5ce8n/gG/loqMxEyqY2/oa4hK6NQO23KXDoFd75ggBHuhN/Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758617744; c=relaxed/simple;
	bh=NewO4njemEniVz7mSlQozZsOjqSCSXJQc2zH/OdZIqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JZAm2sYtYTazE+Jse4yA7MX+cRGLN7raEo5C6DlioYBsVHJ6LE5Pcwho1YqP0RjZWa2uDoUHfArUh3J0VatVxqWbWzLYX7qCebsaUJIC9E7DBdDAQAyvIFdneUBOYxiGl4zS857py3WDK9E/FiMeefkKrmDlCprY0ZiaNaUvLCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RZV5Df7P; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RZV5Df7P"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-77e87003967so1966567b3a.1
        for <loongarch@lists.linux.dev>; Tue, 23 Sep 2025 01:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758617742; x=1759222542; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sq3M1EuezVXyFff7JhHFKkQRUBD32DzfJXZ578Wxpbo=;
        b=RZV5Df7Pax1G7aO/z4/28+JxvNd/PcbdxWe4t8tHO8B+XICPyr/teT5KOHkNc69GLW
         0BW13/GRHs4rCC1R113DHh0ED6l7npcxHZAy+0dV3rIIlwhk02+Mga62wvG0zmZRqY89
         PhXOUfyavPRu4BNnpWQmkUcml2GUHwmZk2mG1aPxD0yKu3OmS6IsgF2GkeUul/Ngkwm4
         yRFVjKo9jHNutkkLEEF8xlqduSDEVQGptbImVka243Yv4JrnaTGa5SA3F8yQZmBttRtq
         0ZCkjDgeIjB5AN/teBLQYZ0wsgNbON1vFdJ1uqNCMKZwV8YnADpRpYnEYFdRbw4mA+xc
         KiHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758617742; x=1759222542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sq3M1EuezVXyFff7JhHFKkQRUBD32DzfJXZ578Wxpbo=;
        b=pmZLCBfC9+u/D4f/xZX0a76YJlGc94jEbq2paHhlBncxGu1q18KqjzGfPoAv2rN2C8
         qcAFChpI4DzmqTtKCNRm5/6FnN9s1xdGa3gkMNsuhFyExbojD6ge+vnpgA/54e78YOB/
         cLX9KvnYrQOF6D+yP4vC6FjSNmZXmv6aw3WwSouK+ow+5Ls6JK2AciAsewtqNrE0vgPk
         EU2WhTVqwbPthoPy7OEUP/XKxgMRi7xUo8kiRoJDwHENpcX46Ov1ODrfVvAN2bW3kKiJ
         xvb+HceZqq/zkCMQRaLrLuBKIW2P0VnOQqAClqaBvfGRlH9hZSAHkqHyH3hHJMFTjA3a
         /e8Q==
X-Gm-Message-State: AOJu0Yz+9M0nS60vJ3OVq33TunW6DYW9W61WzU8KgSzivBKI/xI0lJMw
	/3VK2BRfwpUmz/0xzOwWUmd54FOkZbOR6wOnP3vlUuMX/wzy4eNsjLWY
X-Gm-Gg: ASbGncvWaH7SkHBH9N12bBdDGj+SbK08iOYOcYHRveDWTssoHhKq5WfTMHsEdVLUBdl
	mnAEhAVmxBD6CKNcvd/E3KVVDONajvaWXtmMu46xdlcqZI+M+Y7s/CiIdOcnk04XxeeC9i44AtY
	lFh7f1CNEM65zHxARIZqwgpDkUdOw6qls6GE3vBzn4iKPzcbDLzpjbkdCe/8V+uLWGny7e2f0vU
	lVf1KMk/1Ve15j8UJK20RKh2/RJ2lxfdM1vRKUHxe4JICCmYLxAM3NMViA3w/t/t83EdLYYrwZm
	mAJm7kKNa0Gr+t+/FupuBTbSCTT6yJg/J1JXrMtyHOqDcf1k26O/torXnUNXUK52Uh8OHx2iiuq
	ysD3E01BO6lZYpJAKrHkMVLGahAyU5w==
X-Google-Smtp-Source: AGHT+IGGfdXUVaeqkhhnDFITsRwfUZf/qKWk72D4q5+cPdwEjxR34vD1w6AlhuhA3OMl9cNThDGi9g==
X-Received: by 2002:a17:902:e952:b0:266:9c1a:6def with SMTP id d9443c01a7336-27cbaf114f6mr22865435ad.0.1758617742322;
        Tue, 23 Sep 2025 01:55:42 -0700 (PDT)
Received: from devbox.. ([120.229.24.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269800531c6sm156676805ad.14.2025.09.23.01.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 01:55:42 -0700 (PDT)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	vincent.mc.li@gmail.com,
	hejinyang@loongson.cn
Cc: loongarch@lists.linux.dev,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH v6 6/8] LoongArch: BPF: Make trampoline size stable
Date: Tue, 23 Sep 2025 08:54:47 +0000
Message-ID: <20250923085450.140602-7-hengqi.chen@gmail.com>
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

When attach fentry/fexit BPF programs, __arch_prepare_bpf_trampoline()
is called twice with different `struct bpf_tramp_image *im`:

    bpf_trampoline_update
        -> arch_bpf_trampoline_size
            -> __arch_prepare_bpf_trampoline
        -> arch_prepare_bpf_trampoline
            -> __arch_prepare_bpf_trampoline

Use move_imm() will emit unstable instruction sequences, let's use
move_addr() instead to prevent subtle bugs.

(I observed this while debugging other issues with printk.)

Tested-by: Vincent Li <vincent.mc.li@gmail.com>
Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/loongarch/net/bpf_jit.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index 43628b5e1553..07ca32c673d5 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -1599,7 +1599,7 @@ static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx, struct bpf_tramp_i
 		orig_call += LOONGARCH_BPF_FENTRY_NBYTES;
 
 	if (flags & BPF_TRAMP_F_CALL_ORIG) {
-		move_imm(ctx, LOONGARCH_GPR_A0, (const s64)im, false);
+		move_addr(ctx, LOONGARCH_GPR_A0, (const u64)im);
 		ret = emit_call(ctx, (const u64)__bpf_tramp_enter);
 		if (ret)
 			return ret;
@@ -1649,7 +1649,7 @@ static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx, struct bpf_tramp_i
 
 	if (flags & BPF_TRAMP_F_CALL_ORIG) {
 		im->ip_epilogue = ctx->ro_image + ctx->idx;
-		move_imm(ctx, LOONGARCH_GPR_A0, (const s64)im, false);
+		move_addr(ctx, LOONGARCH_GPR_A0, (const u64)im);
 		ret = emit_call(ctx, (const u64)__bpf_tramp_exit);
 		if (ret)
 			goto out;
-- 
2.43.5

