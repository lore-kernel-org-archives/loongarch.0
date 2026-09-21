Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D122A78F2B
	for <loongarch@lists.linux.dev>; Mon, 21 Sep 2026 14:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790000349; cv=none; b=MLpMNDSzK+uEPZVxhgTcG75jF8AQutsrvZsCpiguKqY9CQWh3sR5E0tgEcMwSaAcRHlIv2ofgeZ6YS7ARw7QMd5plAAHjmKEln4PDvKOBd5EToU21/gGRJgtTV5z6Cau6mihmCzx2bUeAF0Znw/nX8SggUyYjZ8D6VfnOCifoI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790000349; c=relaxed/simple;
	bh=YeeC+2+2L+S8+5NDHnlYj5S1MfCL5SiHgjRm8O/D4Lk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cPLHFFbvrePxAg5y5jEOfEHMsfC0xPUwtXq5G3/hJZUepwSuAFLHP34zhqC/1l+vO+mc8RIUbVUAhCubCkxAeNrciA8VAbbp2H5SNT6wuOt+c4OuRqetoZrqhmELy6ivTINKQXjXmC7vCXsEEoqFopTVEW++LgwOlyb6ih1HEuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=UIopt+qj; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="UIopt+qj"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccead2aecso14751945e9.0
        for <loongarch@lists.linux.dev>; Mon, 21 Sep 2026 07:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790000344; x=1790605144; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hqbKKNT9ux8l56CK0pHK3up35FrU6+62NPcNC6MTw/A=;
        b=UIopt+qjvAusWaCcNDrzFjCCroP6xUzJ0sRBwGc2SakGLyajBHI+8OoIfqpAkjy5DM
         P5EsZs4BcB5zHk1JgH8pNr49eTnfKDp5/ssWSftRNa6C66zQqu1eEpF/q3GUnjBvBNih
         mGSFuwK9quxsVy5tjCHOquHJxOC/4kai3z456hNqXWanPY3cBgvPmjxm6wdE3G7TTdc9
         wh+GxKj8odH/03UpxQ3Lqo3nwIzoDk16lEZz4FVJi8u9T2GhgIlKddODUlG/4zPUYhBJ
         g82fhr3HsDRAdyLwhWLHPtlsh6hrH1IvtOBs8KEEs+c464dM83jkHRT3ASXqiDW4NSMW
         50aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790000344; x=1790605144;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hqbKKNT9ux8l56CK0pHK3up35FrU6+62NPcNC6MTw/A=;
        b=iqoCGa/v1GCF2XdJMNqde/MNpyWQaFSVOFQ4+StOzstn1111lJe+Tmd6FJsqmGrwCf
         iny3nsScAEP5nxakNtGcR53ih8Id2r5a+HvKJ/idvSEMrfFzX/Z2RsqV3/UxvDPzBgju
         IHE7sLBOrgEUXFvRa2aSv3Ty1av72DMorgAq44980UEmROMdBBBNNOyX8TeW1CXbigK5
         /uw0OYtpy9LT1dz3dv397noIf8UgzNt0/UjDbrQY+aYAVehHLrgIPohxsphk01WAJOfW
         mNfKujvq0ZtKzX9rh3+XjBf2xScL4h6/ylBn+g/w/QtoIMbkdx2UJN70mX9hOqEx3obu
         x6Lw==
X-Forwarded-Encrypted: i=1; AKwUvBy8TBhqNM3FozRkoplI5Ad6L7wqY+oRIFPGLH+LJnFeklHZFaJCgedgPpYjq3/T82dHNWm05X9pYxI=@lists.linux.dev
X-Gm-Message-State: AFuF++kIm6Vkk/TpZwv0o7cUsGyFDpN/O4UOc56FhgSfD+wRFrCsDgOb
	2WPckZhTxpuXkZf3m2QXkoSH1Lo1WL5OnlzgLPlOW+pRrTIRushl3/jARnL1hAM2TAM=
X-Gm-Gg: AYBFou2nZE9GIdUq+7cvaqHIxU/0GwNw8gQ6ZiWl4VHH8MdoQxmSezdnmPoe/nw6GpP
	//972k90K1gdV/AS3WFb37fm8TCdE26OF4QP49JO9CeqxOPLeSIv3P/umLwzMUpoXXt6p4IRqU2
	A0Wyl5MgG2tXMGOKNYwWvNOqzhA0ly7Sabv1dXnSbGG7hrmmBMf34PfwGvL65Hw1Bjd1lw7HSij
	7xwFNyWsr9RJvVCG11ezsevdj4gm5VhKHpRl8U1ISLVQn7YuqdxDvPR6do9zvaLRFho2fpgyBPt
	L5hBDRPEVjkFxRSxDR1OJCZqpwMg91jyiFP9qcFEm3gGcag9pPCvUtWNSQXX8oCCUbeHVYgp9tQ
	l5d51nE4FPDX7X/Z1NUS2XnsjyQzJV2oaSjpmq76TAC4NiPSAycItYi9hARfBof4fJ/p5srWfz7
	WrYWuWvF/5QhhlbptDpeQPcEkXCe6KYBIChlNNun9pm98ZJmY0/itPEcrl0WNNCF9q0T7iMuM/1
	d0NJ68H7AXjBmPKOsfb3Mq9SyBr+MFSsUBJJqVRw2EtZ50qSMyYgbLbMawDtQ==
X-Received: by 2002:a05:600c:698d:b0:49c:fc6c:be06 with SMTP id 5b1f17b1804b1-49fc5851ea2mr149001505e9.29.1790000343951;
        Mon, 21 Sep 2026 07:19:03 -0700 (PDT)
Received: from localhost (p200300f65f19a904d4f76eed31f2ef79.dip0.t-ipconnect.de. [2003:f6:5f19:a904:d4f7:6eed:31f2:ef79])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49fcd068124sm226896045e9.3.2026.09.21.07.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 07:19:03 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	=?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Raag Jadav <raag.jadav@intel.com>,
	"Martin K. Petersen" <mkp@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jorge Sanjuan Garcia <dev-jorge.sanjuangarcia@duagon.com>,
	Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Alexey Gladkov <legion@kernel.org>,
	Hasan Basbunar <basbunarhasan@gmail.com>,
	Hugh Dickins <hughd@google.com>,
	Armin Wolf <W_Armin@gmx.de>
Cc: WANG Xuerui <kernel@xen0n.name>,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH v1 0/3] <linux/mod_devicetable.h> deprecation continues
Date: Mon, 21 Sep 2026 16:18:48 +0200
Message-ID: <cover.1789988540.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1180; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=YeeC+2+2L+S8+5NDHnlYj5S1MfCL5SiHgjRm8O/D4Lk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqsTzI0TOeHEQB9Maz2NC3JCpfSuBkzPvIF0T5H Lqgf39rKXmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCarE8yAAKCRCPgPtYfRL+ TmLtB/40aAYP3C3wo4bv6SBsJRxepvOO+jcl0y6KAeoCenvhnVPm/U5nlXY7fUlejd7q3fl0qIH 3wunXaEyWa7N0Hnxp6GBFKmtIyIshbBYavzyzDHP3d5fsKsZ6Ujrq+B/nKu8ErQAj6mJ/WiA/NW Z1n2h7rV+CZzXz2YPqlfSPmNoPgaAOubluHd4AG2oZE2ZXvRQFq/K1UITc7sQJfWHXCJVU22n3n 3M/ol8XaTDGelOFaTVk2GZcRRMLcy2GIMo/r/Is5xaVPfXv8VaR55Ome5joYVhi+rg/rpz9KFWS SyHC1Dd9naehhr1ePCR2X7eNJgguLkS34JjzQc5kFkpvoghu
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

this is a next step in the deprecation of <linux/mod_devicetable.h>.
scripts/mod/devicetable-offsets.c and scripts/mod/file2alias.c are the
only users of that header that use more than a few device-id structs. So
their number of lines actually grows when unfolding the needed includes
into them. Still it is a reduction in build dependencies.

I suggest to take this via kbuild during the merge window. Would be great to
cook in next for a while before.

Best regards
Uwe

Uwe Kleine-König (The Capable Hub) (3):
  Move struct cpu_feature to <linux/cpufeature.h>
  devicetable-offsets: Include the needed device-id headers instead of
    the catch-all
  file2alias: Include the needed device-id headers instead of the
    catch-all

 arch/loongarch/kvm/main.c         |  2 +-
 include/linux/cpufeature.h        | 12 ++++++-
 include/linux/mod_devicetable.h   | 13 -------
 scripts/mod/devicetable-offsets.c | 57 ++++++++++++++++++++++++++++++-
 scripts/mod/file2alias.c          | 56 +++++++++++++++++++++++++++++-
 5 files changed, 123 insertions(+), 17 deletions(-)


base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.56.0.rc1

