Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC5B12B8E
	for <loongarch@lists.linux.dev>; Thu, 17 Aug 2023 11:50:22 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4039f7e1d3aso55189521cf.0
        for <loongarch@lists.linux.dev>; Thu, 17 Aug 2023 04:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692273021; x=1692877821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qcri40AASRR4BFsuSO+X3cA76lV9mjhear1ggGLTZLg=;
        b=TPnESRUpP/KtEYZty2/I71s0M7NdefMLoExvx9rNuW8Reu40ADoBeZFuDMVF9NfGxp
         6jm1VSkNUATDJUAO2waHJf6ZuRjtYXCMibErNn1PcQPInVBNTPt1LynPSb351l+dpPgU
         8uR+Cg6eEt9lu2ZTtxyeF3nm5m96aBb27q3bZOscAOlDDbinhtVDTsvVnyY2e/O41AaR
         3ILuvFu1GOacRyKkb50Aijdm2HXNe87tUgm4ZbMnzvOVpDdRb1OFXssgZF1lCg6+QbR/
         1Votk8z5iyG1pZ5l87yCSStgvjzBnV0m0kH7WLqgSSrGPUh+WiEv7lMxnq7doraeSruP
         83DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692273021; x=1692877821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qcri40AASRR4BFsuSO+X3cA76lV9mjhear1ggGLTZLg=;
        b=hYlNtMAIY1txhh2fpoJgiwNw7nJKra1AtOtbr+jqc+sz6GEYuxO15jj9Bc87wNyMGo
         R8DG37DQwBHKaOrjc+iNpQBf1gEBdpIs//HM2ucdueYHvB/8QDqRydCfQpijI5VscqtI
         +inqDv+Nko30AYkXQErzhXP2eGLkc6Uh+dgbamRAFzs8E/mYvYqPdVQDTW6uofyn9YSa
         CMpLkeLzuZ0Ba19IUiWgxMXIhKVXCG4zFvuuq+6c6NTRiWoGp3XfJTf1LTVTK+CwcjG7
         xcWloghR4+eSt/lsbXXVImYKoTisZ80bO1DX8TK2uDAHCbbXTYF/D4GTXaJNQ+Id/X/A
         dlDg==
X-Gm-Message-State: AOJu0YxXcKr2vmDWGodNdT4pkgTvwqicwEIkYs5taFD6FPauO5ZIzFxO
	QKBhI5OE664kGWUwkaiD4ho=
X-Google-Smtp-Source: AGHT+IGxsq2uwogQdBPmvMNMrm5x/VpIF14pHjZPiMJMm6t7UtQ0zLWCLBZFUfKOaK/uYR3GUwHjIA==
X-Received: by 2002:ac8:7e8b:0:b0:403:b252:96ea with SMTP id w11-20020ac87e8b000000b00403b25296eamr6018736qtj.21.1692273021085;
        Thu, 17 Aug 2023 04:50:21 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id h8-20020ac85148000000b0040ff387de83sm5142149qtn.45.2023.08.17.04.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 04:50:20 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 0/4] general defconfig cleanups
Date: Thu, 17 Aug 2023 07:50:10 -0400
Message-ID: <20230817115017.35663-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.41.0.327.gaa9166bcc0ba
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop config options from defconfigs whose code has been removed.

v3:
While reorganizing the patches, I put the wrong commit message with the
CONFIG_IP_NF_TARGET_CLUSTERIP option.

v2:
Generate arch-specific patches. In v1 I organized the patches by
CONFIG_ option which caused some of the patches to cross architectural
lines. This requires cross-arch consensus before they can be applied.
Therefore organize the changes by architecture so each one can apply them
independently (or not).

Trevor Woerner (4):
  arch/arm/configs/*_defconfig cleanup
  arch/loongarch/configs/*_defconfig cleanup
  arch/mips/configs/*_defconfig cleanup
  arch/powerpc/configs/*_defconfig cleanup

 arch/arm/configs/keystone_defconfig        | 1 -
 arch/arm/configs/multi_v7_defconfig        | 1 -
 arch/arm/configs/omap2plus_defconfig       | 8 --------
 arch/loongarch/configs/loongson3_defconfig | 2 --
 arch/mips/configs/ip22_defconfig           | 1 -
 arch/mips/configs/malta_defconfig          | 1 -
 arch/mips/configs/malta_kvm_defconfig      | 1 -
 arch/mips/configs/maltaup_xpa_defconfig    | 1 -
 arch/mips/configs/rm200_defconfig          | 1 -
 arch/powerpc/configs/ppc6xx_defconfig      | 1 -
 10 files changed, 18 deletions(-)

-- 
2.41.0.327.gaa9166bcc0ba

