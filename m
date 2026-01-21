Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DA82E7F11
	for <loongarch@lists.linux.dev>; Wed, 21 Jan 2026 14:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769004533; cv=none; b=tg8amlrk7djexbsR+4UWE75CDO1B14ZU5bNHGQTfu6BQ80ptC+RYdXtVAUpjLRKJ03plMeW7x73nT6D0Hr1IsjJTj7gb1ye+L1IA3QSlWrro96tVF28mfZnPqrCMD9I83/O5Vib+2RAeen+5ZINHmLCmmPCAYgpSJkqZnNt1Zjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769004533; c=relaxed/simple;
	bh=S3K5qcORE5AzfZszi8va71wgalzWA5E6qM40nVGjfgU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BaFowmRA9e5dztotl47mx804crEn3T4k8352N1THNEvPRp0CFmhqhgOHehBmoImZJkTCOnbIfxRMkbYEOVEyNPiQIXvUpuG4srFMVK5apDDLQhd+0YfTA697qSWL2THDieJA1PhJ0pz0Dts/2CMfXkC4rjPdomqaOPrLzEqYltc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kpeYy2LQ; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kpeYy2LQ"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7b75e366866so1966165b3a.2
        for <loongarch@lists.linux.dev>; Wed, 21 Jan 2026 06:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769004531; x=1769609331; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p+NjXus4jx/cLwloBoG9fVIReD6fVPTamvab4SeFDcY=;
        b=kpeYy2LQKnTpzSdtKqE6F83x8I0MnNauwZInyE1QY5mKA/xkUeErqoPcq487Cpi3LX
         pZHpLsZW+Wt6/cWhkhatbsPxdOtdoYMPHSU/2g22taSfiJGtVRxOybkTqx1OTZkJYW7E
         C+QS2VmaqNYXnbYheOyt4gAJxKJ//Yx6yjRrAEdFr+fJyAa203Lg4/coCzy1HQ8IxxKC
         F1DtjVvsG4tnK4Al+NTecQC3nqd88XzgC80WRMIWLqnC+edvracga+OpnM+hms6bzTh4
         TMG68ImWnIA0m3GD/VrV37DYHT67aP3AejX5rOFFiu4aEVSApg/l66bxXY479fyCB22Y
         w8eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769004531; x=1769609331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+NjXus4jx/cLwloBoG9fVIReD6fVPTamvab4SeFDcY=;
        b=TUIcE+MNwHLbA+UOqaW9JpH6tEDnaq1qtY5Fnrr2nL5gJIkl7wxtrejVNnmNwfeHLj
         S2dOo9TJS5AvhR2WBH9YvZi00nLMw0ganUC+KvJcnXzAX3ZvWcuj7yOWCggDOUzlBhY/
         +qsSRjYDP3YeW98GLMmZrx97CwXXqVFHR/JvEmQCStSf8eC5lkqOAxLT4HuxdpCjUsUb
         ChWDwo8kvR5rc6MhaBnUgWptj30q8SRavSxpfJ6uuZcGsepYvP+N/joyjXLxFFuTWpTT
         d8kpWlmdyUYBXAIPN+ZVDRQXOSoZ3iMsdARrbEUx2hh/ZeVOQyGUD1csa9v1c0g8c4i1
         WucQ==
X-Gm-Message-State: AOJu0YytJbyaZPtC/uXo9UQNS+r+MtofJVTumMmPRSL7WaqV+8E38AvD
	tUgdLGtz5IqdbKQVfS0H+Btb2K1gUiSG2RqVGXqfVGAZ8KeGepW9IkIp
X-Gm-Gg: AZuq6aJEepCPccraIezE+qJqgNUs4MtAkF2h0yONz7+0owus2be4gPVNO98y4DnIMPq
	aJln8viN+yVUBEOFkMohkNUxpjI9TpGZkCD+Mks+BB++UGH6M05q+R/VredzCDplPKPfrDQtzy8
	VnP0go7I/OvPAlkRAxZwME1NorFT07O10+wmuPHKf68d6gCjITpRTsvCvM+todxaNzU/7J3MoXi
	tSFwjF7alzfhGQA55Hi5tAstIqf5B93akOyhU9oa94JklnNga7AAP/CGfRZC2fdPIdsyo6+fT6Q
	1qvgNQ8V/gAOUBl1/6qg90FjV/sNaKzYE1uF/Z+z5hS0oRqCJW1Q7D6/0UGGEFS1IzblgvdmINU
	nCPZHUhxEVXJ4hI1CW/S6MzsLiQHAKqRepeVTZQwFsuazCrDCapG4jAx1lccTZROJ0UqJVGQ/YW
	cBLDBOHaIZbB8MKb6icvqzYagwKJJkdjIfngkfEro0jwnElg==
X-Received: by 2002:a05:6a00:3907:b0:81e:af19:34b8 with SMTP id d2e1a72fcca58-81fe89c05c9mr4844977b3a.43.1769004530662;
        Wed, 21 Jan 2026 06:08:50 -0800 (PST)
Received: from localhost.localdomain ([14.22.11.161])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-82180636c38sm715964b3a.24.2026.01.21.06.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 06:08:50 -0800 (PST)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	vincent.mc.li@gmail.com
Cc: loongarch@lists.linux.dev,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH v2 0/3] LoongArch: More BPF features
Date: Wed, 21 Jan 2026 14:08:37 +0000
Message-ID: <20260121140840.2165381-1-hengqi.chen@gmail.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small set implements new features for BPF.

* Patch 1 uses pack allocator for BPF programs (BPF trampoline already
  use pack allocator, this make it complete), with this, no regression
  on existing selftests

* Patch 2 & 3 implements basic support for BPF Arena, the following
  test cases passed:
    - arena_htab
    - arena_list
    - arena_strsearch
    - verifier_arena
    - verifier_arena_large

This is built and tested on top of the cmpxchg128 series ([0]).

  [0]: https://lore.kernel.org/loongarch/20260110131124.99866-1-dongtai.guo@linux.dev/T/#t

changelog:
v1 -> v2:
  * rebase with latest loongarch-next
  * collect Acked-by and Tested-by

Hengqi Chen (3):
  LoongArch: BPF: Use BPF prog pack allocator
  LoongArch: BPF: Implement PROBE_MEM32 pseudo instructions
  LoongArch: BPF: Implement bpf_addr_space_cast instruction

 arch/loongarch/net/bpf_jit.c | 211 ++++++++++++++++++++++++++++-------
 arch/loongarch/net/bpf_jit.h |   4 +-
 2 files changed, 171 insertions(+), 44 deletions(-)

--
2.43.5
