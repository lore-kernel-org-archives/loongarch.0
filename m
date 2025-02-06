Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C744237179
	for <loongarch@lists.linux.dev>; Thu,  6 Feb 2025 16:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738859396; cv=none; b=re0QYnSalCldLQNwTTQvF11/aZdTRfIzY3r96mkZND7lUycBXXX0X3FdSnR503DmUVGJKeBQMhT6ijF1pyNISESgH4LJ1eZGc76C9Sg12YnJ9TCUbrg4vFgbIh6U5F3tmA/8M8akt4IL8eLvfUleUwtJr1lPeCI+a81S/6Bqcps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738859396; c=relaxed/simple;
	bh=iT1dGSwpnuGP00T4Ar+Kut1BwH96o46YMnM9awaZugw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TizzQaMOVkSIRm57s+QC/VdRrXGf9wifLJZUxIHjh5cVmXYNPxRwuK+wTIWChAGGqjgly1PrGelfyoXsB6FcWsLos8awPkdtqMB4AefjqWTjlRA0XC3XJTIsieyYKuotMpxMRT3KPfOswhYZ2LNRNyHp+OZMciLvd3cRdJV/aLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EZ3nYAfg; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EZ3nYAfg"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aaeec07b705so207944466b.2
        for <loongarch@lists.linux.dev>; Thu, 06 Feb 2025 08:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738859392; x=1739464192; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+oHRfsKZwrAHmNfmaoBp4cNVz8j1BX173gqVMxnYc0Q=;
        b=EZ3nYAfgbQSyxZjAhuVayMGEcQ8AYruWSWi4SvUsMqK8DNC3GADtJWq1/nH1hwN1lD
         yqb8bOh4VQPW33iRhoatTqUlk9pXQVKabopU5aHkCzLhy36I5S6wX3DgAg2tykYOhuEX
         seHnzKir1teOi8HMdCV0N+zwpShKSuUOyE0JvfQAdClr/n+H0N8q+t+R5EQK75CLNrl7
         exoPbtu2pwC7HmtIdteY8nnVr2MXbSk2I2KSY2gPVSyGoA0EdZOfqX80SEFgQVhEoRlV
         +yTOWT4/q2yr2glFPzdDy2dGOOJ6ZOfYlqTC74CPyrJ/AMUK0ANzpGuPcyq0in3d+MqB
         JG7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738859392; x=1739464192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+oHRfsKZwrAHmNfmaoBp4cNVz8j1BX173gqVMxnYc0Q=;
        b=Kv6HEGUUNqHW/3/iTfpdltHkrhk2vqVre9n4kKoYUBPGX1hkUfeIjuhbAbc6ATFvfY
         +G4RsiBNw0j5j4hr9LP+NUZ2RNGfCDWkP4p1yGbtTcyT5da4xmdA7+vc8J3FQSO5g27T
         H8KhzFsf6RZLksMRo+/Auqnlzb1AvYS9uDZNcjaQoyaRxRKUnFIGiqXFA09dvqAw+snf
         +Pa4x6GSaPNXruTLd9U6VGuUGdU9XMVWcsARQ+hz0gymtH5cV2W0g4vp+dSUxzTRDzG6
         pEudPkRPJSOk9Wht4JxvJDt4qKP6vqQbXQ2GivH7uTs2+klcesbtiLztdC53Of4F0sj7
         WchA==
X-Gm-Message-State: AOJu0Yz8j3ItpwwgcqbY+hzzjSM4OSofeMoUFKp3H7MtRlnFt3SbsvcR
	f4MDbAt2kmliuOZI8K9mXsAcA3Hfm7aI3ZdOEsdvaDGlagpUhSAcqIDeuHF0B9Tszh/xycaDbHs
	6Okw=
X-Gm-Gg: ASbGnctuXC04/oL+ZkAcLDkWOvH/QLHL0Ff3tGoyMhfLkqOCH6HuALJnr2Ug1gYFtqv
	giKnQADd1xA8WmJbVM7gXHBSEUVrBLdTsCitEkqn68PDKsaTRb0pJKGpqzbNc2WdJC79BLbqBvc
	W/8ouePBj4xB2TbxValEq+LSUEFDZdnvIA0xb6ZGry38B8LZhtIiIhjOzRiOxXvJu8F8LszZL6s
	mGjboEZt8mPxycu3g5967ytvj/096dLhgekyyr5oPlA0h0hryehHyELY1sfApHPEa2pdSFJgqNz
	jvsAmL8Hz1Ux+ZRX+gLyPVgZog==
X-Google-Smtp-Source: AGHT+IEAiTv3bhqmUm7QYxdfJUhdzZ/eVors1B4C6qvg+EKYN0W4MZJZUGLnR7vaav6rNnOJD8/DMA==
X-Received: by 2002:a17:906:6a14:b0:aa6:79fa:b47d with SMTP id a640c23a62f3a-ab75e21fd40mr782332466b.1.1738859392286;
        Thu, 06 Feb 2025 08:29:52 -0800 (PST)
Received: from localhost.cz ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab77365c9fdsm120445466b.169.2025.02.06.08.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 08:29:52 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: bibo mao <maobibo@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Frederic Weisbecker <frederic@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Youling Tang <tangyouling@loongson.cn>,
	Peter Zijlstra <peterz@infradead.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 0/1] loongson: Fix idle VS timer enqueue
Date: Thu,  6 Feb 2025 17:29:21 +0100
Message-ID: <20250206162922.3028861-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch aim to fix issues if timers are queued because __arch_cpu_idle()
only checks if TIF_NEED_RESCHED is set before going to sleep.

Changes are described in [1], and [2] improve the patch further.

The following patch is the result of [1] and [2] combined.
Code compiled successfully, but I couldn't test the changes because of some
trouble emulating a loongarch machine; I tried to boot with and without
this patch, but a panic occurred, due likely to a wrong VM configuration
(panic occurred right after the i8042 probing).


- [1] https://lore.kernel.org/all/20230811170049.308866-5-frederic@kernel.org/#t
- [2] https://lore.kernel.org/all/06cf8750-901d-2f65-fb9e-81980688e017@loongson.cn/

Peter Zijlstra (1):
  loongson: Fix idle VS timer enqueue

 arch/loongarch/kernel/genex.S | 33 +++++++++++++++++++--------------
 arch/loongarch/kernel/idle.c  |  3 +--
 arch/loongarch/kernel/reset.c | 23 ++++++++++++++---------
 3 files changed, 34 insertions(+), 25 deletions(-)

-- 
2.48.1

