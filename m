Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AE91C860B
	for <loongarch@lists.linux.dev>; Wed, 27 Aug 2025 11:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756293567; cv=none; b=ttksqH00L3t+5ULoaYhLJNlMX3AWrCzbYtC2OwkR+hL4sdvCjL47ASPXpdWjBC20/88fnigfqDA6rMy4etXRFX3f1PcNRG6x8of+NMkuCPoeItotyDTPxeS/qZaNK3A+yDDnxFa57pHpstYnBHRqepzd9Nm1eALKq+wyTmEKT6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756293567; c=relaxed/simple;
	bh=ddBCvL3X83QlTd+5WQd87vKRmMu0/T6UgLHIyN93SB8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Da1CqI1TxwIEgvsoC7Ae11CIovg4YDecMearR3UzeD3eDGz/I9TBj1X/r05robXNEfvujLBzSjufns8fQX1mrzmBcYnY5c58MJGiHDXvP86h7cUxkYmdQ7M/2MmvVDiN5vj4lriJD3qmQjBz8uPCwVdfGH6CMEcHndM2R70HPBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hk4E52Ov; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hk4E52Ov"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-244580523a0so65730345ad.1
        for <loongarch@lists.linux.dev>; Wed, 27 Aug 2025 04:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756293565; x=1756898365; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=93FWKoT6dFc5J2SoWMKbByMa7GuFs+3MAuu7ATorRVc=;
        b=hk4E52OvxDmXvcp6CcwMfdEwETO0hstEL+KtdtznhmUyd6ZgrcvODg7x+oKyhfss5H
         xDfHZqtIjC6QZaMu26dI7DXmkMNxix9HMs2d0tzFbYxYW0KNTRXPaJuz7AhTjGhWwIaI
         6NbZwsU7FmywRAJGD3CpdmULXwwBrqOy5pqYWQJuw7aX6CigC9TBtarGYT4wepLzsCdK
         iXnZTCMLH7YF2zmJojQcFDtK+YYi9S1F8E33Ck76H70SLLTOj1P0nucDtoqyyQEyPY1u
         vc8YrJfv4OAdLfkTx7rYPFWisSp7UXs9S/xSxlp3qULmJlrNRfPrDlES6S/br0rEb03i
         O3mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756293565; x=1756898365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=93FWKoT6dFc5J2SoWMKbByMa7GuFs+3MAuu7ATorRVc=;
        b=uAYao7Wo2C4va3CqXkXcWe0RAc9BQyeeC/8vTYniSIH5Tfz3M0JGpU0rC/BztlyNhJ
         W46ZV+i0SrbS4GCHTxNNryICiez0S3oiT78fgZuh9IxRLW1vul305taBwERtq/z5oPr6
         mANL3V1UX+ARmmUuvHVcB3CtUq4xwoUcP07fSRf0Ho65tUmMHXc6gZGxiwyQn6hU2sbD
         uAl3wdhZfKOVBFXcFRriDbuicsW0U18TaWBrUC/19G45FGu0XcHkBH5ySy0m5RDTWer/
         OD5ZW+tkN9QMbN/K4LOKrfn1Rx0Wk7f8D0ZKAcSPMBKPl8K5HABM7UEFqbUqS72yRA8L
         m/jQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOzWYCLqJ0l3St+6oNtmcAtYYFez0jM+9DzHNMOHLA/yF4ZTEkORmkL5zLpLn5rhXcKAgphLwq3y4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxVLsTXBSgi7mhOxjazj4GyEZGMApjAxpm9qCfjnEDlAs+Yv2lv
	VjTVQpMfJwsBILvRtClZo6DUS/RHShzA3jTqdJ9Oe97LbNnanQjd94Y0
X-Gm-Gg: ASbGncsK6N/4gPKvGIFvXaekgsI5ETy9N+EwGFhz3mHfmGxyleyUs8Da9OMB0MJxEMm
	KiStyyyM6KWEuJqNGJlt6TKkLCXU2RcdrhLkAmCQE5CWFGYsGWQldCF3i60Gy8Vp7aysIpWnaZj
	wRbZg0YMhW+lByQFiGp8p4l2U87hDgp/DY/i0rHa1ssK0Zq7TFyy3yovCrfzSzChlEigivG5amk
	ky5piTyn2ouRlIZibMc0whTaTsbmVjvQTV0kJcJQKPjiRHcycl4jjuRO/qcqktTiJ3uEdo3u6fP
	vds1RLxlurSXeH1AP6dWcxvDMKj0raIo5zu/nvpMsQvU7HXXl3dA3BMWO3r+eA0rQI4yH2Ni8+m
	N4C4cVqElBYCEgyAFuBnPiYhkPP0rOkWkyMNDIZzc
X-Google-Smtp-Source: AGHT+IGHMyUCOUNe3WdFTytTI7vDD/W3K7K34Nd4VIqs9KdtpdHS1TLuZl4AOc0Ub0c52sQDgDVmBw==
X-Received: by 2002:a17:902:ce82:b0:246:4de6:5cc0 with SMTP id d9443c01a7336-2464de66f6fmr233640965ad.53.1756293565298;
        Wed, 27 Aug 2025 04:19:25 -0700 (PDT)
Received: from devbox.. ([43.132.141.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276f8a3335sm1829729a91.13.2025.08.27.04.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 04:19:24 -0700 (PDT)
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
Subject: [PATCH v2 0/3] LoongArch: Fix BPF trampoline related issues
Date: Wed, 27 Aug 2025 09:47:30 +0000
Message-ID: <20250827094733.426839-1-hengqi.chen@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following two selftest cases triggers oops on LoongArch:

    $ ./test_progs -a ns_bpf_qdisc -a tracing_struct

This small series tries to fix/workaround these issues.
See individual commit for details.

While at it, remove a duplicated flags check in __arch_prepare_bpf_trampoline().

v1 -> v2:
* collect Acked-by/Tested-by tags
* update sign_extend() in patch 2 as suggested by Huacai

Hengqi Chen (3):
  LoongArch: BPF: Remove duplicated flags check
  LoongArch: BPF: Sign extend struct ops return values properly
  LoongArch: BPF: No support of struct argument in trampoline programs

 arch/loongarch/net/bpf_jit.c | 35 ++++++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

--
2.43.5
