Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DCB3C0F
	for <loongarch@lists.linux.dev>; Wed,  5 Apr 2023 14:17:56 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id er13so100480288edb.9
        for <loongarch@lists.linux.dev>; Wed, 05 Apr 2023 07:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680704274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOC1m1IyvFx7hqlIu85ltj9Okdj8PWnyI3fah+Gac6o=;
        b=dw4QAoMpVGLEOeYQ9Yo6hrg7uuDz1mqcfEuifQdcdnb1mCRfnp4USqcIZ/tj+yoqqd
         NuZo8Fl4HHUAk4my79oi/1gAt96ZaHSFf0NyBNIA2ujrdK0vV+BtAz9cZUh1HP/21L01
         ZfOBKFtABC40OHga/xcc6LZLy5bp81QTL5BA33wmnqyDDroTbAF7IVTNrZhDCZYY5uav
         cpNPwfW8+ndEboG7KmpMryAu2BP5Ht2BhpnVlW+EgEVP3Hv8o6yChfq1iPaWIKJDgzD/
         9Y/9bUrxWUeU4eBT8lu+LsRKzoAiRRbIgYAetGEXNMYLkTxdyCEUikhfLAP1CktMT2oa
         eHBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680704274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fOC1m1IyvFx7hqlIu85ltj9Okdj8PWnyI3fah+Gac6o=;
        b=4GB+TNXaEZsy+Dcyp2j1kBPkmkYh+n7rhN4TUz712rnBD+DtQOWEmpPjhA2zMsOUc1
         7s8UnF2c3jz9820wIbkifSU76JRFca+PxRi5TMzujaID6SzRxm3Ip/fUp9R6+pgyhUr+
         kS5nRScmJO33pXs40RVva9YkM0El0NZTkU+Itim5yqL68f9UD+3A5Qopt6aXqFwxrSbW
         62p5MjzqaelQjAMH3dcA10Nsm9LbfgEX+vykE6+OLwaenpHNyjqKLI6p+mmn8DTX6c3c
         gLZqV5fE1h9T4rG2A/kEw7IDQQquMiSluzo5lGMZeGrfImUQGeS4zoQsZh50E8aGAtUw
         MXHA==
X-Gm-Message-State: AAQBX9cOiIFmbH6ZCVlYISsmxAu7HOWW4RJMeBCQwaXb8CHtzGyB7Dqz
	LHNr1C11/lCNO2EnYXJ/9GE=
X-Google-Smtp-Source: AKy350bz5YnNlQahgd6VXOTs26Uhu2FUvH9WVqbCQND0Gop8QRbR/cXdIQACyHoPPOUtbLiBje74GQ==
X-Received: by 2002:a17:906:4a8b:b0:944:43e:7983 with SMTP id x11-20020a1709064a8b00b00944043e7983mr3280252eju.67.1680704274221;
        Wed, 05 Apr 2023 07:17:54 -0700 (PDT)
Received: from localhost.localdomain ([46.248.82.114])
        by smtp.gmail.com with ESMTPSA id g6-20020a170906348600b009334219656dsm7381246ejb.56.2023.04.05.07.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 07:17:53 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: linux-alpha@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v2 4/5] locking/x86: Define arch_try_cmpxchg_local
Date: Wed,  5 Apr 2023 16:17:09 +0200
Message-Id: <20230405141710.3551-5-ubizjak@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230405141710.3551-1-ubizjak@gmail.com>
References: <20230405141710.3551-1-ubizjak@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define target specific arch_try_cmpxchg_local. This
definition overrides the generic arch_try_cmpxchg_local
fallback definition and enables target-specific
implementation of try_cmpxchg_local.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
---
 arch/x86/include/asm/cmpxchg.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/x86/include/asm/cmpxchg.h b/arch/x86/include/asm/cmpxchg.h
index 94fbe6ae7431..540573f515b7 100644
--- a/arch/x86/include/asm/cmpxchg.h
+++ b/arch/x86/include/asm/cmpxchg.h
@@ -221,9 +221,15 @@ extern void __add_wrong_size(void)
 #define __try_cmpxchg(ptr, pold, new, size)				\
 	__raw_try_cmpxchg((ptr), (pold), (new), (size), LOCK_PREFIX)
 
+#define __try_cmpxchg_local(ptr, pold, new, size)			\
+	__raw_try_cmpxchg((ptr), (pold), (new), (size), "")
+
 #define arch_try_cmpxchg(ptr, pold, new) 				\
 	__try_cmpxchg((ptr), (pold), (new), sizeof(*(ptr)))
 
+#define arch_try_cmpxchg_local(ptr, pold, new)				\
+	__try_cmpxchg_local((ptr), (pold), (new), sizeof(*(ptr)))
+
 /*
  * xadd() adds "inc" to "*ptr" and atomically returns the previous
  * value of "*ptr".
-- 
2.39.2

