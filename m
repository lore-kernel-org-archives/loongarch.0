Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5E13C34
	for <loongarch@lists.linux.dev>; Sun,  5 Mar 2023 20:57:01 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id cy23so30648131edb.12
        for <loongarch@lists.linux.dev>; Sun, 05 Mar 2023 12:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678049821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uKMdOBSHNrQUgSWU9KR0ogbHUm36R1MCQj8zVPpN6EQ=;
        b=mU214HoBD9PhosOri5UfMQjRIEUU9I7ZxXJTaKzr9RcaKrtgXfOrYoiIrC1H/cgukR
         nGR3h38W8sHvMacW4UFXHQQDKZCvOloFPDQjKO9O//zDviZ9mQzevFeYU88TK71GZ7Yl
         D/k8cQsg+q4J+35dqG/OlVnh0MnVnhlAufeVmyjxTwVhOBT0LoXY5y0X7PCib/wU0Eyx
         +QpOr0musHR7lTYq7pSl2aAa1WKY3GvzHvpUUY9s2BqBAo6O2o2u90yeCuiEiCaWos8D
         58spoyzzG9c6tD9JstLQOIUhjogJWxBR9MJwe+mON+OA4NcDB3DdTwAuF12GKQUZRS1z
         /wOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678049821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uKMdOBSHNrQUgSWU9KR0ogbHUm36R1MCQj8zVPpN6EQ=;
        b=DJy385s6j1VllxwOt5VlQWmZmNmpjPyRsJCLUkff4eqoJ8st/qLPG0A5HKuQevfWQD
         iELX5NMjTKYclw6ZwUXorJAIfbXgXsv2wltiTZYWpg3YDYeFDpllui+pOfprh3X0F1rb
         IIWXBJHyKGcLJ4nhXREeKDYE4PQ4xzKQsf0gI44lgquBvxcLOr72ktzMXGB7WPJLciQK
         WqiE85lNZefMeuTa9c/rIHogOCQGKbYAeZaaHBRxf515e/y+xfHfle2rdu5aCdYviQiK
         9Unll+rfDamp6umdQ5bsqdasfvGlFaW4NHvbYyivqiGS/ZeVFxROSVuBr9sUSFaEQ1G1
         GQDQ==
X-Gm-Message-State: AO0yUKUpFCYzYdFrS6Af6QiYjjFsVIItx7/ekL1b7kgPNOewUShJWajc
	1ELuVRkt91vcyuIqF9TeGJQ=
X-Google-Smtp-Source: AK7set9JmkSQG/Vtrq8HSHi055snSsQ75iU15X3bC3GR1ZZPzMtMJBUaiieJD+9Jtu7PbJHJEQIXfg==
X-Received: by 2002:a17:907:1c1d:b0:8b1:3a8e:232 with SMTP id nc29-20020a1709071c1d00b008b13a8e0232mr10822778ejc.74.1678049820999;
        Sun, 05 Mar 2023 12:57:00 -0800 (PST)
Received: from localhost.localdomain ([46.248.82.114])
        by smtp.gmail.com with ESMTPSA id ay24-20020a170906d29800b0090953b9da51sm3615436ejb.194.2023.03.05.12.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Mar 2023 12:57:00 -0800 (PST)
From: Uros Bizjak <ubizjak@gmail.com>
To: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arch@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [PATCH 05/10] locking/mips: Wire up local_try_cmpxchg
Date: Sun,  5 Mar 2023 21:56:23 +0100
Message-Id: <20230305205628.27385-6-ubizjak@gmail.com>
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

Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
---
 arch/mips/include/asm/local.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/include/asm/local.h b/arch/mips/include/asm/local.h
index 08366b1fd273..b611361a760b 100644
--- a/arch/mips/include/asm/local.h
+++ b/arch/mips/include/asm/local.h
@@ -96,6 +96,8 @@ static __inline__ long local_sub_return(long i, local_t * l)
 
 #define local_cmpxchg(l, o, n) \
 	((long)cmpxchg_local(&((l)->a.counter), (o), (n)))
+#define local_try_cmpxchg(l, po, n) \
+	(try_cmpxchg_local(&((l)->a.counter), (po), (n)))
 #define local_xchg(l, n) (atomic_long_xchg((&(l)->a), (n)))
 
 /**
-- 
2.39.2

