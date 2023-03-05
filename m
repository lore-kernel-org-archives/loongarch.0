Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC623C34
	for <loongarch@lists.linux.dev>; Sun,  5 Mar 2023 20:56:59 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id j11so11263896edq.4
        for <loongarch@lists.linux.dev>; Sun, 05 Mar 2023 12:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678049818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4dp+002KTo48dpecC7Fg4F0z+wg/mF+qKQ/rqBRLLmU=;
        b=FJhdq7LVPwcBcvn6/riybPaEEFIp0/r+l4uien9VYX13snE+6dd2SRb+yMPMDhYYbM
         3AUs+n1H+CpJ8GDv0U77dUTxE8RjQ1eWXLj+bg/IVt1gChmG7p7sJb2ClN5MKQVBKiHA
         NH0EMDT03tcy/lSh5xX41OU6Nskj9OCGpTzoieRFH24h3GENB49/lgCnuichf7wUhvLm
         YsQlX9dGfnwd59NipJUQH4HuchN0vUmHSZ5pwgrti5UGvSZ3bP144EUY6UqvAOkml+nl
         yVef/gktEHzCBna7fndw2/uQjOF0b5Chrheidug0MCn0y1l15A0pcTSH9l17N70mnuzK
         JNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678049818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4dp+002KTo48dpecC7Fg4F0z+wg/mF+qKQ/rqBRLLmU=;
        b=jLxmZ59qxIwww/+WjPG82mFFTOyELguM6qAYpZm5qzAeZQTCEzeDhCjE/7iLhswY0S
         YiwqbmaClxpw1UiHxpyZ76sVN+wCnMSmU+Swcc6oKXXB8Fab0agwfi6NSGwLhHbbEKce
         s9z8UhMG2NDLN1D24ttS92GRP/sQ66M9VdIy4rBzmEdzlDACaLPNe2KMzf17dqHNvjnS
         nxWTZdyCHm48/dLdP1jxtGqgEmouqP9DRcS2VxRDTAjHenzn//0NDV3HYtdzFzVV9g4M
         pOSGYw/aErsbhXfs5RQJWVTkczvx5yRROzpU7qZ3iuHP17QCu16CEtw9a1TLdT1pm3P/
         fqog==
X-Gm-Message-State: AO0yUKUp96xIbJliyIhM/cgIBuP/Cg/JW4xWpk8lkvXobRTAuHyx1Hss
	hq4PGmGWnluguwCpdgzkqnNDaLMlYX/2Lit7
X-Google-Smtp-Source: AK7set9JJNLz1ulU/hVH+IH7j0C6i0gQzHulORbRJDsCWP1JV2FwRUAnR4ik5vqV9X6krnih1Xg2WA==
X-Received: by 2002:a17:906:33d1:b0:8b1:7ae8:ba79 with SMTP id w17-20020a17090633d100b008b17ae8ba79mr8537582eja.30.1678049817877;
        Sun, 05 Mar 2023 12:56:57 -0800 (PST)
Received: from localhost.localdomain ([46.248.82.114])
        by smtp.gmail.com with ESMTPSA id ay24-20020a170906d29800b0090953b9da51sm3615436ejb.194.2023.03.05.12.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Mar 2023 12:56:57 -0800 (PST)
From: Uros Bizjak <ubizjak@gmail.com>
To: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arch@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>
Subject: [PATCH 03/10] locking/alpha: Wire up local_try_cmpxchg
Date: Sun,  5 Mar 2023 21:56:21 +0100
Message-Id: <20230305205628.27385-4-ubizjak@gmail.com>
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

Implement target specific support for local_try_cmpxchg.

Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
---
 arch/alpha/include/asm/local.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/alpha/include/asm/local.h b/arch/alpha/include/asm/local.h
index fab26a1c93d5..7eef027e0dde 100644
--- a/arch/alpha/include/asm/local.h
+++ b/arch/alpha/include/asm/local.h
@@ -54,6 +54,8 @@ static __inline__ long local_sub_return(long i, local_t * l)
 
 #define local_cmpxchg(l, o, n) \
 	(cmpxchg_local(&((l)->a.counter), (o), (n)))
+#define local_try_cmpxchg(l, po, n) \
+	(try_cmpxchg_local(&((l)->a.counter), (po), (n)))
 #define local_xchg(l, n) (xchg_local(&((l)->a.counter), (n)))
 
 /**
-- 
2.39.2

