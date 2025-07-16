Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D7F2F5C4C
	for <loongarch@lists.linux.dev>; Wed, 16 Jul 2025 16:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752685178; cv=none; b=eZlTQBR4z0Re38jS62Mi78srzyQzfgtqOgjmvNnKr7gf6Equ+3XvI7rLv9itzc/pgK12l6fsZtbWI3C7JBuQkqHi0k1sgUXV6ssuG48zYXxhfMW9+jHyDN6eizEQjyktgFeU4gEBybyrLc3FC139EXKjkmoMeO3eaHf+ipG3FI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752685178; c=relaxed/simple;
	bh=Ue2EyeAUqDPHnyzWjRAybkK0fJice5caV1/hEaqAOyo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TNFsTB+CKOCtp7HZA2aVXzJZXTmfjoWuvjkKDkp94dg33QlB7j/waA/Ct4Y9xmiAxRNLJelMR8MhqMc5rfeDE0K8wlQRy7jc/L++HSYC2BhvUVsFgNHgBwKO4U03pboyxw3XsHkFerdJrpGYhm701Q69k3zeWsKO11EyNxwq/Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fRuWxMSL; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fRuWxMSL"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2353a2bc210so298895ad.2
        for <loongarch@lists.linux.dev>; Wed, 16 Jul 2025 09:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752685173; x=1753289973; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pWXltKeailaeCE7O4zeMIE5KwQLx7OFkEcvLJdPrfgE=;
        b=fRuWxMSL73Dm3yBoSlSup7G1c3OCR5DrLH9pJisI2QcwqeCMFRCQasal/qlLDfmIW1
         8TncoI4cgCZrjO8SQaTwhDgvLWx8adQAGL5Bgm63vgEnV5/6k3jiqAbAxa7/H835swM0
         l2yu4DMxCv4f1nP9p/MNMCDGb98eJqq036B+wl+8v/qceJlwyx8F3VIq4dRlD2mO98Og
         +5XYTPVOuTB+8twaQJaxdkN+FzL44eyZzqMvinN18+S6aKrBHns53BdslZKiCZUq5Y94
         q3excrkVRFE9SxQCFzU8He0iv18zsj5uFVzrTXBXeO7hb+064mmwir+VjA7QDg5UqopH
         EPXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752685173; x=1753289973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pWXltKeailaeCE7O4zeMIE5KwQLx7OFkEcvLJdPrfgE=;
        b=sk76+JHChmSUurro5IwfGeB7CLcWcmp30YGjp4hCqhQKRZ8ewCMS0Kw8xTRqfHK+7Z
         nEKJVwNfQe3K7DgUa6DHz0WEiQPPd0f5MXyJ/mvNRtiV7PwRAdrwRqihujm9QMUlpezK
         lsx9fxG7NGyfU/6fC3XlPkiIom68oo62nTXcggQWkE9HjieYzwz2aWf7sDjXbToeXxAO
         QYaJCetaGAmTfz7ZX8XRDWU+mfgiiX58NC4qBGdt4OkyZ9xMer5EMlM1gSMVaRJoaA7H
         VsWkrAYoNNFX8CFHDuOyItEIQ/MCLgKooULFekypjWVfgfyKSI6ucmSNclSQQbtLAKxS
         22BA==
X-Forwarded-Encrypted: i=1; AJvYcCViTtYvg1biYCX6VwcSazplkQ7yIVMbODVgYoEt86yUZhi8eBZXcPITbBPr0kdY5jjKB7YchDCsvSM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1U/THH4qK765lroi8sS+iW29f5J4+FuLSQAQCWzeckMh0fN2w
	/GMLBZ0n5htKjGcSD4PFoyNLfBCVE7CTK3LWnHNdWDvy71wG14Jg/s6Z
X-Gm-Gg: ASbGnctX0pI8vdJ/yATXpHwvNZFpsG8QVGz+PjPiO/WiQnq/dXqMV+IajeFDIKmh5nQ
	pVR6+cbxfFJU0VPUXgTFwrT4jF+sNyOLizAV4hqgBHqra2k0Jc1QZ7jNQsz0LZHMUFGswznrE1v
	9ik1OIVUKztx0UhQEFT2qGCphgWYiCFfK8HTkvue4Ah8Sa5IqlP7iCeyqfoynR0yaehB48q/7B6
	GlzIRe7TJpPQ42Mjn9iNr12n5Hcl0C42I3edGDsGFRp65pKUJx7VLBnRx+v9+WbMg2hb1f+AlRq
	IaoUsJYHWnyU/Ix1vh1rqnkergs9rDJ+DA3AulyoD3R3ZXas6npmESyCoHR0DaG/xR1zkivvk7N
	kIbTWEUhWq3hq6Hn2oAzM8w==
X-Google-Smtp-Source: AGHT+IHqWTXk2BJJVzrTEM0r4STe67WQG+3Gltp+lZVYutv/v33bO1hPVnMLPxR0PO4AQvxpsXFixQ==
X-Received: by 2002:a17:902:d4ca:b0:235:2ac3:51f2 with SMTP id d9443c01a7336-23e2578d93amr47766305ad.45.1752685172773;
        Wed, 16 Jul 2025 09:59:32 -0700 (PDT)
Received: from localhost ([216.228.127.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4286da3sm134406665ad.34.2025.07.16.09.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 09:59:32 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Yury Norov <yury.norov@gmail.com>
Subject: [PATCH 0/2] LoongArch: KVM: simplify KVM routines
Date: Wed, 16 Jul 2025 12:59:25 -0400
Message-ID: <20250716165929.22386-1-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yury Norov (NVIDIA) <yury.norov@gmail.com>

Switch KVM functions to use a proper bitmaps API.

Yury Norov (NVIDIA) (2):
  LoongArch: KVM: rework kvm_send_pv_ipi()
  LoongArch: KVM:: simplify kvm_deliver_intr()

 arch/loongarch/kvm/exit.c      | 31 ++++++++++++-------------------
 arch/loongarch/kvm/interrupt.c | 23 +++--------------------
 2 files changed, 15 insertions(+), 39 deletions(-)

-- 
2.43.0

