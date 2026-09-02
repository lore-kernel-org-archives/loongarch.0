Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0543B3D1CA8
	for <loongarch@lists.linux.dev>; Wed,  2 Sep 2026 07:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788332867; cv=none; b=UFVnEj8/syscnutOKd9rwdM4rGLeZB2niUgNyo0VZ6SijH7zCxyCIyRB0SYxk8NJcqAouHRTsdK086Uz12UcJdbIxPzr8z0ulgAkcwnG6FioAMKjJ2Pht9pt2w46fgwC8kHkk0ejf3JR3haYuOTwr1qrqb+FRQMIHWcnpL/dt84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788332867; c=relaxed/simple;
	bh=E8kneu2xkHnm37YD035uh928QAzihNqmk/fd94fujuo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SByZs38phmq23Z25XhIu+ePVdVCoPUjYvYbFs2S6QHsDBAD/6d34xBgw/D1TSqcE7rV1krQHr7GyJKfV3v4VvH8kHiBbUmNEzyTMaUGDMEvs8w21xDpPSgmrmbqElVDhJqyPZOFJwL9OSLG6iPSHEB7OeNhQk+bRHD8JwpE3aw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kWy66pGe; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kWy66pGe"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-398b1e63c49so1898558a91.0
        for <loongarch@lists.linux.dev>; Wed, 02 Sep 2026 00:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788332864; x=1788937664; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pjw7Yj8C+EGcBYthQYN8Kf9YjAONN+Q724TMv0sxgAw=;
        b=kWy66pGeS5JVwrQXNiToL5snlNsdKITC3iSLDeuAVafdu8bARnaHft0IlFX4GReWne
         y4sXpSSFZoXMMhrRutI9m2MDLXYIGHSmLCTiEmtoFt7Bj4DSUe1RC4cjXqKAUT3NE1zx
         5+QYqXEPVEUD1wS1nkhKmNK1QesjOz/pF+kPODW6/2hfrIGJ5KoXEyaBsK7BRniqkdoL
         ZY9UtqXBuUuUXNsdEfYnh/3B/S0AeYF0QA/CBWDxN4RvMCwOfGDWAKUnaNgG7iaF8f0u
         qe83Y+SvyrUBxpLveMApfhGuiTFveBH6GcS9/lxhIQJxOi0u8pNanBVNLMo4G1GsSOf2
         WgWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788332864; x=1788937664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pjw7Yj8C+EGcBYthQYN8Kf9YjAONN+Q724TMv0sxgAw=;
        b=OMfH6nRKYYfQepQwaaHg7ACDDMvT/oUDof3kRGg8gtURRWD8IGgfMmXxfL3PqqJ1Ka
         6Vun831XsE/ieCTw4t3vLWm8qjPATgB6qTFZnIvLEuCKnzKOa4Qikp22LnlgPxdbaIF/
         0nwl2+YXAZCHb6mEnHkNQYcJQ0uCM3/eWc/dckcilaAxvAHf5Ycrh1rnHP6QOnK+5hg1
         pFXSMlQZAR8ZzX+NIq0RgUbX2N9TTQKLxNg+FTlqBA3KOpYSXng5+TUZ2tZsiXhJtM0M
         2pAyIwzwakUF5HOqZuaHle6vJHNk+pBQ4kwaXGT1pfQ7wGZoBKJUSgYV/LLrpT/nnAbu
         xV5g==
X-Forwarded-Encrypted: i=1; AKwUvBxxH3bm6/H7USizdJNuEhCwT4wwnvKZN/fvbWDMsfMVT/b7Es2pbRi+3lxDishy/+xO2Cr+2A+YeME=@lists.linux.dev
X-Gm-Message-State: AFuF++nLSDy7OmNJ4aAU8NAv75WjMtN817Q6Nf/6pWx/hDZZv9xMdf07
	ChTIve3Wxbc/7MrIhJuPjCNUVdl9UcS3v1H3HSudgJcLNoc1Bvd60L5iHu8+2jI/h8I=
X-Gm-Gg: AYBFou266kKNppoM75s60dqKejoJLN1Xw4mA/iuM6iEB1RtyFDtbDQ24GgVXz285qEN
	ABefE24fgz5m4hcxUms6luns9eSM3buQ5SRhPjK1nYuJuJvekbo/l7wmaf8l8ebz1Aiv/4QfBGV
	ddTz6BuyrVw/a1Nw99yK/vfXr/1zJyHt6Z73OHWsUfPJgEE/EQygn/Vu4HP2TKDxzybDFwJkRGq
	gU1+dKuiPZLmOTSIN0k5G/shR+OVgej5+v+8FXC7YeGHwPOolMjysxBJGDJv7TF4jSPEOCdrRPj
	IT1hqLkFiWS4Whyix0PnMpeju6LeiBsGof4xalvwxF3i7bVUHJ9Y6ZYPY0oJGPOYvqxrcuV8rap
	LqIQUEos26H71xEO83mKl3r3p0yzH0clmkVL+EbI+K5F4xj60gy+cvvdke6h+RvflHiHlPM3cZx
	xzLxgxxyrCmWZ5OyOpWs8B7b+uTw/8ccDIroHs6UpBbgdgEzgRLI196ccXmTvhKsn51V1bHxiuF
	Q==
X-Received: by 2002:a17:90b:3c09:b0:398:c0a2:8f8e with SMTP id 98e67ed59e1d1-39af64f9205mr1192783a91.26.1788332864187;
        Wed, 02 Sep 2026 00:07:44 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f079c33f4sm4173256eec.1.2026.09.02.00.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 00:07:43 -0700 (PDT)
From: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
To: zhaotianrui@loongson.cn,
	maobibo@loongson.cn,
	chenhuacai@kernel.org
Cc: kernel@xen0n.name,
	lixianglai@loongson.cn,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
Subject: [PATCH v2 0/2] LoongArch: KVM: Fix kvm_loongarch_env_init() error path
Date: Wed,  2 Sep 2026 07:07:21 +0000
Message-ID: <20260902070724.3459457-1-nagachaithanya9911@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817115847.2705791-1-nagachaithanya9911@gmail.com>
References: <20260817115847.2705791-1-nagachaithanya9911@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kvm_loongarch_env_init() leaves everything it has already acquired behind
when one of the IPI/EIOINTC/PCH-PIC/DMSINTC device registrations fails, and
kvm_loongarch_init() does not call kvm_loongarch_env_exit() on that error,
so nothing else cleans up either.

v1 unwound only the memory and the perf callbacks. Bibo Mao pointed out
that the device registrations should be undone through wrapped unregister
helpers, so patch 1 adds those and patch 2 uses them to unwind the error
path in reverse order of registration. Patch 2 also uses them in
kvm_loongarch_env_exit(), so that the device ops are unregistered on normal
teardown as well.

Link: https://lore.kernel.org/all/20260817115847.2705791-1-nagachaithanya9911@gmail.com/ [v1]

v2:
 - Add unregister helpers as suggested by Bibo Mao
 - Unwind device registrations in reverse order
 - Use unregister helpers in kvm_loongarch_env_exit()
 - Split into two patches, so the fix only uses the helpers
 - Reword commit message to avoid implementation-specific details, and
   retitle from "memory leak" to "resource leak"

Compile-tested only, no LoongArch hardware: loongson64_defconfig with
CONFIG_KVM=m and CONFIG_KVM=y, W=1, each patch built individually, no new
warnings.

Chaithanya Lagisetty (2):
  LoongArch: KVM: Add unregister helpers for the KVM interrupt devices
  LoongArch: KVM: Fix resource leak in kvm_loongarch_env_init() error
    path

 arch/loongarch/include/asm/kvm_dmsintc.h |  1 +
 arch/loongarch/include/asm/kvm_eiointc.h |  1 +
 arch/loongarch/include/asm/kvm_ipi.h     |  1 +
 arch/loongarch/include/asm/kvm_pch_pic.h |  1 +
 arch/loongarch/kvm/intc/dmsintc.c        |  5 ++++
 arch/loongarch/kvm/intc/eiointc.c        |  5 ++++
 arch/loongarch/kvm/intc/ipi.c            |  5 ++++
 arch/loongarch/kvm/intc/pch_pic.c        |  5 ++++
 arch/loongarch/kvm/main.c                | 32 +++++++++++++++++++++---
 9 files changed, 52 insertions(+), 4 deletions(-)

-- 
2.43.0

