Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CAF12B8E
	for <loongarch@lists.linux.dev>; Thu, 17 Aug 2023 11:50:28 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6bd0c953fd9so5246890a34.3
        for <loongarch@lists.linux.dev>; Thu, 17 Aug 2023 04:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692273027; x=1692877827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c+nDhh2frJ5rtud07auXQfzVPHXfuf9n6EEcx54ErNQ=;
        b=q5Rz1bz+tlGec22lyJqb+dnBLAO37++FyG08/ANEpgGygzmpDlk2txcu7SmnCgYLGR
         1gLzZzXBCJ1BpJR3NHDOjF3zKHh4FDT4imVwG2rv8pejZwhwXlJshTA+sd9VthymbCo/
         CR7v9w0HecUmZdqsGR5XPBrCrMxaDxX6YwMxauh9QHHGoWblO+HxnR7N8AbwiWaBu82V
         uQ0y5YgU1HyKaDaWFBaaQYtC9EhHmBbh+1UN9UV2qJfqqyMTDMSe+ykpDE5DLMTcOFgi
         my8f1Mjn5TZSAHh8myrZipTIiwtCDPWLXxih6ReW6lip0Y3E0KBQ3PnrteRklEedkr+V
         /J3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692273027; x=1692877827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c+nDhh2frJ5rtud07auXQfzVPHXfuf9n6EEcx54ErNQ=;
        b=jzf51uU5P3zKyIsV7GMOSkpFZOhi2lfzC+RmvTYh07vZm6BROD3Qhf1CVp7Srf8TBH
         sQmhB3mWg3DGbsqIfem0qAgC5kcDzBEbvnJrY8GUXgrxlnPFf2YkHU3K2Nn8jRoy/EQn
         DY4b1SIdUjHqyQiIQqNeOnWljfqjcK4aPsVlhptK5xkPr3k3KiQ0prCaO2MjOOfGdfnC
         cxuNsHwCG0PqM8gl2jq8ywKcXeA9OfiwcNeGPBMa8x5tzKzdARYOMKN2QktF/9Z7mQSf
         JRLNAcqzBLHJ3fS8ysbkDVvVflMpRIsRrLVW8Nf0DdFsjT/mTjeDdAH3vmPyFVR+hNvd
         uIuw==
X-Gm-Message-State: AOJu0YyqC5irRyVHYErQyaS797/ZdjluC5qB34870oCZP12SxIPLqFS/
	oDLcxWncYBq1SXaT5clwYOc=
X-Google-Smtp-Source: AGHT+IEhD3LMTkc6/F7q0IsHcS+/3v/BnR1TCSpsowcZN4qpAo7D2JmM9DEvRK9PXGZz9zM7G4Z7Yg==
X-Received: by 2002:a9d:7a98:0:b0:6b9:b600:536 with SMTP id l24-20020a9d7a98000000b006b9b6000536mr4348805otn.27.1692273027292;
        Thu, 17 Aug 2023 04:50:27 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id h8-20020ac85148000000b0040ff387de83sm5142149qtn.45.2023.08.17.04.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 04:50:26 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 3/4] arch/mips/configs/*_defconfig cleanup
Date: Thu, 17 Aug 2023 07:50:13 -0400
Message-ID: <20230817115017.35663-4-twoerner@gmail.com>
X-Mailer: git-send-email 2.41.0.327.gaa9166bcc0ba
In-Reply-To: <20230817115017.35663-1-twoerner@gmail.com>
References: <20230817115017.35663-1-twoerner@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop CONFIG_IP_NF_TARGET_CLUSTERIP from any remaining mips defconfigs as it
was removed in commit 9db5d918e2c0 ("netfilter: ip_tables: remove clusterip
target").

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 arch/mips/configs/ip22_defconfig        | 1 -
 arch/mips/configs/malta_defconfig       | 1 -
 arch/mips/configs/malta_kvm_defconfig   | 1 -
 arch/mips/configs/maltaup_xpa_defconfig | 1 -
 arch/mips/configs/rm200_defconfig       | 1 -
 5 files changed, 5 deletions(-)

diff --git a/arch/mips/configs/ip22_defconfig b/arch/mips/configs/ip22_defconfig
index 44821f497261..dc49b09d492b 100644
--- a/arch/mips/configs/ip22_defconfig
+++ b/arch/mips/configs/ip22_defconfig
@@ -127,7 +127,6 @@ CONFIG_IP_NF_MATCH_TTL=m
 CONFIG_IP_NF_FILTER=m
 CONFIG_IP_NF_TARGET_REJECT=m
 CONFIG_IP_NF_MANGLE=m
-CONFIG_IP_NF_TARGET_CLUSTERIP=m
 CONFIG_IP_NF_TARGET_ECN=m
 CONFIG_IP_NF_TARGET_TTL=m
 CONFIG_IP_NF_RAW=m
diff --git a/arch/mips/configs/malta_defconfig b/arch/mips/configs/malta_defconfig
index 743209047792..ae1a7793e810 100644
--- a/arch/mips/configs/malta_defconfig
+++ b/arch/mips/configs/malta_defconfig
@@ -127,7 +127,6 @@ CONFIG_IP_NF_MATCH_TTL=m
 CONFIG_IP_NF_FILTER=m
 CONFIG_IP_NF_TARGET_REJECT=m
 CONFIG_IP_NF_MANGLE=m
-CONFIG_IP_NF_TARGET_CLUSTERIP=m
 CONFIG_IP_NF_TARGET_ECN=m
 CONFIG_IP_NF_TARGET_TTL=m
 CONFIG_IP_NF_RAW=m
diff --git a/arch/mips/configs/malta_kvm_defconfig b/arch/mips/configs/malta_kvm_defconfig
index dd2b9c181f32..c07e30f63d8b 100644
--- a/arch/mips/configs/malta_kvm_defconfig
+++ b/arch/mips/configs/malta_kvm_defconfig
@@ -131,7 +131,6 @@ CONFIG_IP_NF_MATCH_TTL=m
 CONFIG_IP_NF_FILTER=m
 CONFIG_IP_NF_TARGET_REJECT=m
 CONFIG_IP_NF_MANGLE=m
-CONFIG_IP_NF_TARGET_CLUSTERIP=m
 CONFIG_IP_NF_TARGET_ECN=m
 CONFIG_IP_NF_TARGET_TTL=m
 CONFIG_IP_NF_RAW=m
diff --git a/arch/mips/configs/maltaup_xpa_defconfig b/arch/mips/configs/maltaup_xpa_defconfig
index 97c2d7f530b3..0a5701020d3f 100644
--- a/arch/mips/configs/maltaup_xpa_defconfig
+++ b/arch/mips/configs/maltaup_xpa_defconfig
@@ -128,7 +128,6 @@ CONFIG_IP_NF_MATCH_TTL=m
 CONFIG_IP_NF_FILTER=m
 CONFIG_IP_NF_TARGET_REJECT=m
 CONFIG_IP_NF_MANGLE=m
-CONFIG_IP_NF_TARGET_CLUSTERIP=m
 CONFIG_IP_NF_TARGET_ECN=m
 CONFIG_IP_NF_TARGET_TTL=m
 CONFIG_IP_NF_RAW=m
diff --git a/arch/mips/configs/rm200_defconfig b/arch/mips/configs/rm200_defconfig
index e0e312dd968a..5c5e2186210c 100644
--- a/arch/mips/configs/rm200_defconfig
+++ b/arch/mips/configs/rm200_defconfig
@@ -90,7 +90,6 @@ CONFIG_IP_NF_MATCH_TTL=m
 CONFIG_IP_NF_FILTER=m
 CONFIG_IP_NF_TARGET_REJECT=m
 CONFIG_IP_NF_MANGLE=m
-CONFIG_IP_NF_TARGET_CLUSTERIP=m
 CONFIG_IP_NF_TARGET_ECN=m
 CONFIG_IP_NF_TARGET_TTL=m
 CONFIG_IP_NF_RAW=m
-- 
2.41.0.327.gaa9166bcc0ba

