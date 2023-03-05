Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384AB3C34
	for <loongarch@lists.linux.dev>; Sun,  5 Mar 2023 20:57:04 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id g3so30877300eda.1
        for <loongarch@lists.linux.dev>; Sun, 05 Mar 2023 12:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678049822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=25TOpB6uAuDptlCHYXnw8K0sBZK8F7O48wtvqw46Fco=;
        b=cNd8YqsFIPxe+JP9zRF39U9LVtgmwfXjcFbHH84MFejyyz+WXmA51xlzYADH9AC01W
         lEszc02CudZI42k7pYdy16Vf4WI6WjE1DZx56EjyaZpyY7FvA1+pVY1RSyjgr+NlrGpr
         yFwug2e2C37vzQDmuS5CJX+8dF3kzqMWXP62SO1BV9+XSfgAJAzZ1JEkQPQMUXgK2qm4
         0hyBNzM1O3Kv/jPXAGYRtlnLBj1s1v9YygYUST1D+zx9Ey2ipnETSfTUq5UPh138ocjy
         r6cJKI1TIKvZxYHHrTVVuJQaSsFt81JXXkjl01KWi2F25uQE45bvL71Q902loyxf7ehM
         /C8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678049822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=25TOpB6uAuDptlCHYXnw8K0sBZK8F7O48wtvqw46Fco=;
        b=Rah/VHn80BZ9pqkAnuiVTC1IMsjAIomR7MzNq8XFl9j3PZ0UfCVv/v78UkptkyrGym
         VkeepbguyPL/se8JXB4rAaRSNE8onfTa75bmIxmDPdMFBTjD93pcyyGvIxISTphz2xkv
         SCK1eiDKZrmxO+l+h/JvZAFar47rneiWKXVV44J5Xyf4UKO6vLwpCoUbXEoODYZWcJzN
         TXqPjyQEqFCIAfYrQ7OoaFXUWF6Y77GW0gRdFwzaMIJqFdaTPh6d6j251lpxR585fApi
         9b9VlLTvyTpL1X8lF0ZpCkFBMODZde69ZR9n3bMt6gaNPDX2Ub5ev5W4jK+IBfingf2n
         99yw==
X-Gm-Message-State: AO0yUKUavKIhewy8u9BoMM/c9o+i7qCcJtIsKR0fRyg+MZz9R/j/S5R8
	DWMzW1xpkfTc443ea5kKojA=
X-Google-Smtp-Source: AK7set9H+42xPHqyPW7jGUPzVIpjv1MvOVftLDcjvJIUsaEDkzaQZ+a/sQDSm0+Tof/iIVl2G2SuVg==
X-Received: by 2002:a17:906:f18a:b0:887:8f6:c1d7 with SMTP id gs10-20020a170906f18a00b0088708f6c1d7mr8937367ejb.38.1678049822541;
        Sun, 05 Mar 2023 12:57:02 -0800 (PST)
Received: from localhost.localdomain ([46.248.82.114])
        by smtp.gmail.com with ESMTPSA id ay24-20020a170906d29800b0090953b9da51sm3615436ejb.194.2023.03.05.12.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Mar 2023 12:57:02 -0800 (PST)
From: Uros Bizjak <ubizjak@gmail.com>
To: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arch@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 06/10] locking/powerpc: Wire up local_try_cmpxchg
Date: Sun,  5 Mar 2023 21:56:24 +0100
Message-Id: <20230305205628.27385-7-ubizjak@gmail.com>
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

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
---
 arch/powerpc/include/asm/local.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/powerpc/include/asm/local.h b/arch/powerpc/include/asm/local.h
index bc4bd19b7fc2..45492fb5bf22 100644
--- a/arch/powerpc/include/asm/local.h
+++ b/arch/powerpc/include/asm/local.h
@@ -90,6 +90,17 @@ static __inline__ long local_cmpxchg(local_t *l, long o, long n)
 	return t;
 }
 
+static __inline__ bool local_try_cmpxchg(local_t *l, long *po, long n)
+{
+	long o = *po, r;
+
+	r = local_cmpxchg(l, o, n);
+	if (unlikely(r != o))
+		*po = r;
+
+	return likely(r == o);
+}
+
 static __inline__ long local_xchg(local_t *l, long n)
 {
 	long t;
-- 
2.39.2

