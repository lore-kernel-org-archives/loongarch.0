Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381433C34
	for <loongarch@lists.linux.dev>; Sun,  5 Mar 2023 20:57:09 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id cw28so30810118edb.5
        for <loongarch@lists.linux.dev>; Sun, 05 Mar 2023 12:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678049827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Rhi81UV6n4gJ23KpYxVv3UnO+FDfYmlmuIH3bT2sEE=;
        b=aaSodGvZdSV4IP+c2rumCkx8LxrQY+OBcusU42ckg9I4HKl7svI97bHUL8PVa79jUn
         xPkYv74szn3W9Ezoiv7g17E92uqKZF9Q6lBk+rGSEagwXuvpV3i07e8Pkz9ghdOWM4i1
         iAl7K94WX200NR6mzgorkcWMi2oDE5W7MB8oFzbbHYstFEsoUP9VT8+2rb1+kLDxgFBE
         ZcscWfl9eYRBg4Ct/7ikk8jQHl/U1WRWKyYDrbRBQqttA6QIp2sq8CY+PM01/wuGFC2y
         y6zmednb1IPxVz9Qo9+FsPJS256xZdDaz0IlmMKsI4jFxJQKu6pKz93CrGfjPPmVLESV
         KAMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678049827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Rhi81UV6n4gJ23KpYxVv3UnO+FDfYmlmuIH3bT2sEE=;
        b=kUfR0JroU9V7U4qOg0GzJ0tq7mml83OFfwytIcPQDegx3N/Y6gG5wT7YCmnUVFedjC
         o3cdYy93+Hpu13uIxwKsynUrOl3ps9qdsP8N2VLhpp4sICLJrQwhU2qrODFRnI4O9BTM
         InQ93n6jdS4DrluLqqrDeh5RJCbsgrH9ZtZjhISa1a++60IYsoZvP1gZht6YbzzU4pz6
         P9sMW733M50DZ1qewA2l6nDs7X8bDGwOsNEVdh/b2SgLfZnjI+2VQ9JX+GB98NXCdW7T
         iE+nrCxViSNsPmRjm/TwmKR8kJI/qlnfHETsiyb6tee3xVaoWCefEK31UweBqH+DsBjV
         7SGQ==
X-Gm-Message-State: AO0yUKUJtvNR9cbrH7m46WopooJfr9ukiT8gh00dCUHHmqSd7B4TwuuK
	gtOxzKOGqOB1+SaAVUQiu6Oz6c0qplLKYq3Q
X-Google-Smtp-Source: AK7set9KsKppg5AWKoMtA+hKEWxwqg26/PPfzfADGxEx0JJl9+WRzjaOFmjzce84cTTXvCp3CMtMKA==
X-Received: by 2002:a17:906:408f:b0:8b1:7968:7fb8 with SMTP id u15-20020a170906408f00b008b179687fb8mr9606766ejj.62.1678049827406;
        Sun, 05 Mar 2023 12:57:07 -0800 (PST)
Received: from localhost.localdomain ([46.248.82.114])
        by smtp.gmail.com with ESMTPSA id ay24-20020a170906d29800b0090953b9da51sm3615436ejb.194.2023.03.05.12.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Mar 2023 12:57:07 -0800 (PST)
From: Uros Bizjak <ubizjak@gmail.com>
To: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arch@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH 09/10] locking/x86: Enable local{,64}_try_cmpxchg
Date: Sun,  5 Mar 2023 21:56:27 +0100
Message-Id: <20230305205628.27385-10-ubizjak@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230305205628.27385-1-ubizjak@gmail.com>
References: <20230305205628.27385-1-ubizjak@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable local_try_cmpxchg and also local64_try_cmpxchg for x86_64.

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
index 94fbe6ae7431..e8f939e8432e 100644
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
 
+#define arch_try_cmpxchg_local(ptr, pold, new) 				\
+	__try_cmpxchg_local((ptr), (pold), (new), sizeof(*(ptr)))
+
 /*
  * xadd() adds "inc" to "*ptr" and atomically returns the previous
  * value of "*ptr".
-- 
2.39.2

