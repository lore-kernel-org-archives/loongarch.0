Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466CD31DDBB
	for <loongarch@lists.linux.dev>; Tue, 23 Sep 2025 08:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758617736; cv=none; b=Wlv0A0QznFWzHr3xHDE89cACg4MwcpogczGkMxiEAAuGMLpmHviOxYUQ1UCfurQ77p5FDOJYsIIcU1ta10RDxVyW617N5EwLbzPolOZomkVGlQeWJ+Phg0aOUzAOXi1+WKMj00sH4Fcq6c8nHNSkhbRLALq/BI70WfpcAF+XMi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758617736; c=relaxed/simple;
	bh=LUemA4N08X5oDb4xxfSMdr2TmHBXwmyKrepX1+wihzo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nYvejlaEQ0qog10dvlsKP5M0A3WVirA6WzR0iy2LbF/uEjm9gG76OswkgqrfPJAO54xLqsdL8O+GL5VpiG9U+eDOpkddIrLgRUHh05c13CM+fOIbga6ZZ7Ixy94Tq/XWaw0QB3yvtqPrmFKXJRYd7IWANXWMNjYEKA8iYyaWP2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KXzA3SZ9; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KXzA3SZ9"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-273a0aeed57so26790985ad.1
        for <loongarch@lists.linux.dev>; Tue, 23 Sep 2025 01:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758617734; x=1759222534; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QaoQaQg2GZ4ysBsECGEcp1W6hQwHJZzYlnTF1RhwwV8=;
        b=KXzA3SZ9z6qFRMijV5NxMFXrIEHw8GG+Y8sEt/s1IazbanNoivgW7uMxd8xcqiBqzc
         0zbEsY32IGSQ2DV4pv5j8s0gdbSlSQ5hQVpNOT6M69EccBW0VbqftrsaSyovJfGxx9fz
         tM3AUWlE8iyBldvwqXlE92ypL7WvgrpymgXhZkuQBCbyyMleY0LohyijKt/Ae9JFm1D2
         Gp9rIs82QelPepiuj1yEAi9GEakjqFtA4qPKKqYvKEGIHJDKMtfvxgRgQlilJSafHxtB
         PXv8c1zXjbuTx48OepyTV/DNa9c5/GJ9w+aSOTCXgX5YBawzgU7ijHydEwli63rEvex5
         chcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758617734; x=1759222534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QaoQaQg2GZ4ysBsECGEcp1W6hQwHJZzYlnTF1RhwwV8=;
        b=u2D+tcSxiynpFXUtjw8pifrZf86s/JIJZkdvOhkhW9f6gip6QgbV+4XT/At77uDpOZ
         PDtyTqhOej14yq5ZKxXD+6t9o4QhZKRWtWQxCv9j5SobfUaaMSq1Mw7W58uDyuijxxcp
         uwgxsf9P8sHb2y63CgrRBH7utPq/INs/q9PHs9c7rOVuubqXO4uavPnEnTczNnOw6LoI
         aW0WapUjAtvbIZpseyADNN9nVPiAfygTMP0Sq8ewh7LXEbJGyRBdT1AAuWXzft1jQxRO
         FwbqxSDl6ltTESKpyJRI/z9tP0WZmjBnZgjNxV1EXIpwiOQFO7Q1/i/vhuAGMsRH6GHd
         g2tw==
X-Gm-Message-State: AOJu0Yzhc5mHnW3l068qqjyeZB0fhzdqLrZe+KmmdmaJE3yNncsY+Lhg
	+o3bSsyJskseOr8oaI0NLJ6VQeZ4SCWYdUwl/KuPsDvKIAV/EDfHS/vB
X-Gm-Gg: ASbGnctxObEv3K1ariUGhZ+WXlPb2UophQP8f5eseJ4f+IdviW2w7JTqNWeUGFOTOWE
	as9l3L/2IwdKe5TmDwab2JFtsUDYcRuTQyuiRHKR0uwaT9bWmuM52q57ZGiPUo9E4nAqacTcOWD
	J92ZwDgLJdQzY9JfHZhCe3KMhYS5Ok2cMDdGHjo9HZLbIn2OmGUYc0p1JuCyblBcTIw4DLyDC8v
	SCfeZKj9w1vE89IivYFJE+/gWo2lj44qyp6Cam03chEqjYVT4inafmzSIXKBjO+AVIJwXq5S12z
	xPXGgN55a142srcSTM2Ywuc4Aghhjq+DILxMwwM53fZEA/6l7EhOPLCRXiez6fzzY/66EW6G5C8
	pY0bY0YkBrFNXSPTCdbYUkxqAegGpZQ==
X-Google-Smtp-Source: AGHT+IFkvk4woZMcZWc1Sc0M5pukXrYBMOq5yPbxFfHNoYT7ixOk4ggxFIhZQJngAtNhyEPSPPuLtw==
X-Received: by 2002:a17:903:2447:b0:242:5f6c:6b4e with SMTP id d9443c01a7336-27cd6e8b738mr21472205ad.7.1758617733499;
        Tue, 23 Sep 2025 01:55:33 -0700 (PDT)
Received: from devbox.. ([120.229.24.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269800531c6sm156676805ad.14.2025.09.23.01.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 01:55:33 -0700 (PDT)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	vincent.mc.li@gmail.com,
	hejinyang@loongson.cn
Cc: loongarch@lists.linux.dev,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH v6 4/8] LoongArch: BPF: No text_poke() for kernel text
Date: Tue, 23 Sep 2025 08:54:45 +0000
Message-ID: <20250923085450.140602-5-hengqi.chen@gmail.com>
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

The current implementation of bpf_arch_text_poke() requires 5 nops
at patch site which is not applicable for kernel/module functions.
Because LoongArch reserves ONLY 2 nops at function entry.
With CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y, this can be done
by ftrace instead.

See the following commit for details:
  * commit b91e014f078e ("bpf: Make BPF trampoline use register_ftrace_direct() API")
  * commit 9cdc3b6a299c ("LoongArch: ftrace: Add direct call support")

Tested-by: Vincent Li <vincent.mc.li@gmail.com>
Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/loongarch/net/bpf_jit.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index 7b7e449b9ea9..35b13d91a979 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -1294,8 +1294,11 @@ int bpf_arch_text_poke(void *ip, enum bpf_text_poke_type poke_type,
 	u32 old_insns[LOONGARCH_LONG_JUMP_NINSNS] = {[0 ... 4] = INSN_NOP};
 	u32 new_insns[LOONGARCH_LONG_JUMP_NINSNS] = {[0 ... 4] = INSN_NOP};
 
-	if (!is_kernel_text((unsigned long)ip) &&
-		!is_bpf_text_address((unsigned long)ip))
+	if (!is_bpf_text_address((unsigned long)ip))
+		/* Only poking bpf text is supported. Since kernel function
+		 * entry is set up by ftrace, we reply on ftrace to poke kernel
+		 * functions.
+		 */
 		return -ENOTSUPP;
 
 	ret = emit_jump_or_nops(old_addr, ip, old_insns, is_call);
-- 
2.43.5

