Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868F8E571
	for <loongarch@lists.linux.dev>; Mon, 24 Nov 2025 05:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763963815; cv=none; b=nhQtrT5lmoql0XYv9iCJsz8Z+Mr/A7+ixOQykjCNxsLBbsKG2Nk/BlEprEMBPxPQzjXCxajN13YRPm4lb3zFGHcsCt6OiZXKUc8j9LAaE7bfx5O7Av8Quh/VhKah//CG3KXS+NBH5wRhS3GsUpD41bJwh0dJySLYVSR7GOAoakc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763963815; c=relaxed/simple;
	bh=U7fXjuJ1uvetLZd2ROxrkXNl+tkPWnVlxClKEKlLn2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U1+heRCTaRu/tMWnt7uCqDsahkQExldA+qQBn4kW2MrFVBdhJ6fLnl/G6RJ7Q7vYrSljt4nrQUue7ygX3UPXuYcA03If3gsK0SvuOK2deB4LVWP+ncDX9omsCcaK/9LIGfDNPj+kDkIdhdadNPEmtkihz58QshiVf9geZyQ+s2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mIgDwf97; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mIgDwf97"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2984dfae043so34647195ad.0
        for <loongarch@lists.linux.dev>; Sun, 23 Nov 2025 21:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763963814; x=1764568614; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hnwZNFUJzBzH5flZlTauprLg54cSvWYIdktawTc8avc=;
        b=mIgDwf97bqdvx6cuvwKTRK++LEH3vAZSFwHSWgtd5qR1od23mAUI78Za79IudhEymt
         D6cG8O43Aeerbbkq7ajoBROh+hC4JB+YLle/d+UJpr8c2qHxd1t7Pxxjb6UujsV49xnu
         nUm259e0weeA0CJFaGPg75qP8HxjWfdLZt0EafdZm+MQvh/8LtOlOka1K8r8xIwa5OUU
         wz68KkqmEOa3iBlGHyocvIjjJsT8itMs9BuMSq2TEeMBFoSFMJIjK5iatAMRuGMK3Leq
         POjC0THIYlzrC6pEfIPoBCbAw6MwTs5yxNf6fD2kQoyICvEPMha9xKM6vKAZyvYQ84Dm
         MClQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763963814; x=1764568614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hnwZNFUJzBzH5flZlTauprLg54cSvWYIdktawTc8avc=;
        b=R9h86vF48XtwEeivfLR/Nh10gJAcP0J9AwF1EMzzdaJEOv4AdIzoPPaCbO5RWqTbj5
         qtQScDpeN7o0FHXZJRSBkVBbgjyqSnKpyLs1/lgppP9Gsove8/j/oFEo150XV0GbX2D0
         mNqDF7eBIj03fv09Mty1VxIQkXeNQEF6dGb5f4oEaizyLS2NvyIMUkdGucUM7vakEzLg
         OL6JV/TK9xse1aLzGBcQAb9021cZoC9Rnvk0qh7VFWp8cb79oCewHX//F5RoywObb07w
         c8mk1fIy4JFpc2v0H8HAD4nkzKKkWR4laQhmO+d/d97uBQ78IDgIFBAeBlWDd5mUaEOZ
         w6gg==
X-Gm-Message-State: AOJu0YyZrhJDl7gixES/y8jY/yyrvxF30FVPJ1h2Kf9MkOCQgv3jQ6Za
	zZ8ttLiWDHuVTL/fYSoAeZ730KAV5yIe4XVLN9GV/5x+aFIi5NfCQYyn
X-Gm-Gg: ASbGncsIHUnKYSFDTzFby6LtM0R60IzY4+f5Dg50klTJ1bely2VpKXxEMDcgCP6hKaN
	yoA+9OfoNMiMYKvYH1X84VCyDxHnWVik1y9hIj6E1vnRQgFjaZLyvy4ShvtuG4bkvmfQdMfiBL0
	i/UkxLvCqpRDLHu+rkMpM79N4NpHIPchvpg+zlq2YpwXDO/E+1V2Bp5sOz79c2hlzzMEew2GT22
	fFKqmXPK8cBXRi+MjdHem1QaUstOnGHbT/Yt3V/6JY7lSiAoANIWb9i3qp8iv5JYIFoo9Sa3qpa
	Y/AHlBFlXvNTfT2Pba8rEZAsD+p0IiGUgH/M5ZzQ7wj70PSAwZnFz7arYpMl3asXo3Ngwi2v3cn
	Al9GbMuFtUCFUrY8q5i8NFESEHb/LMy66MmnlGh7ms9AMt84XltG2QZqHGVoOz0jaWM413UaSye
	0IksIqsR3V5SqU9SjcxZkd+gO8Mo+l
X-Google-Smtp-Source: AGHT+IEmF62U0SK4GCX7Pn+2GOqodrDfcul9i7HduyS3P+6x/Vck6ihW6xWuyJPihoGFu8UCarLp3Q==
X-Received: by 2002:a17:903:40cf:b0:295:105:c87d with SMTP id d9443c01a7336-29b6c571898mr108344305ad.32.1763963813705;
        Sun, 23 Nov 2025 21:56:53 -0800 (PST)
Received: from devbox.. ([43.132.141.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b106094sm124881785ad.10.2025.11.23.21.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 21:56:53 -0800 (PST)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	vincent.mc.li@gmail.com
Cc: loongarch@lists.linux.dev,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH 0/5] LoongArch: BPF features and fixes
Date: Mon, 24 Nov 2025 05:56:37 +0000
Message-ID: <20251124055642.1591-1-hengqi.chen@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small set implement new features with 2 bug fixes for BPF.

* Patch 1 fixes a bug discovered while testing the BPF Arena feature.
  Without this fix, the arena_htab test case which use the
  bpf_arena_alloc_pages kfunc will trigger a kernel panic.
* Patch 2 fixes a subtle bug for tail call index, this can be verified
  by the verifier_runtime_jit test case.
  See the following two threads for background:
    - https://lore.kernel.org/bpf/CAEyhmHTvj4cDRfu1FXSEXmdCqyWfs3ehw5gtB9qJCrThuUy2Kw@mail.gmail.com/
    - https://lore.kernel.org/bpf/20251005103518.996383-1-luis.gerhorst@fau.de/
* Patch 3 uses pack allocator for BPF programs (BPF trampoline already
  use pack allocator, this make it complete), with this, no regression
  on existing selftests
* Patch 4 & 5 implements basic support for BPF Arena, the following
  test cases passed:
    - arena_htab
    - arena_list
    - verifier_arena
    - verifier_arena_large

Hengqi Chen (5):
  LoongArch: BPF: Sign extend kfunc call arguments
  LoongArch: BPF: Zero-extend bpf_tail_call() index
  LoongArch: BPF: Use BPF prog pack allocator
  LoongArch: BPF: Implement PROBE_MEM32 pseudo instructions
  LoongArch: BPF: Implement bpf_addr_space_cast instruction

 arch/loongarch/net/bpf_jit.c | 225 ++++++++++++++++++++++++++++-------
 arch/loongarch/net/bpf_jit.h |  30 ++++-
 2 files changed, 213 insertions(+), 42 deletions(-)

--
2.43.5
