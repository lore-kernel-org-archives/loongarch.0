Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D485119D8AC
	for <loongarch@lists.linux.dev>; Tue,  4 Nov 2025 08:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762246170; cv=none; b=KSvsUStuqM6PLxLljxYQVCSOa9AMxKF0ktF56P9KxQt3ASclXDJWIovim9Oa4WeoqPGdXrq1mpBeSFTKbojg8f0UARw/30Ngjj3jTb5h8ultLH1k3L8YiHUU5/ZZ6vJVsznsJv9UmeIbRvdWz5r4gQQT6SVT9VnJSO4aHcsLAq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762246170; c=relaxed/simple;
	bh=bwGYumF3/kIIW+zzveEhCKzNJ0ATBCRDR2j8OQO/23Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DhzmW261LiFxhVQSeLd0zPFg4In+cc88Ld0Mv1j3A4aw73zpXzwBI07lr/Aie8ctQqIjn70ovsWnb5BpVpvRB1UBniOO2y9gNcADrS51SQS8YqSnNBTWD1F5u+LYf+O/PJo/lkFQYuR/nlsZ7WWSiEExdx5EzogGLVgAnVHdEM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HPOrGtJP; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HPOrGtJP"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-294fb21b160so37321175ad.1
        for <loongarch@lists.linux.dev>; Tue, 04 Nov 2025 00:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762246168; x=1762850968; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vZzjlCCT3j9j2Nd7pQrTgnxvKhulGcz35Gruny6M5Bw=;
        b=HPOrGtJPMUxpmcUS4r+wZB+RQWVEGX6bvO2ZMbZ7U7p4Y0DI0ZyxlJzzpUKGVUv7IQ
         A9F22n97GmR8ExvQW0Cu8TqGV+rqJ+h/sIvoSaW8tuCHOP82CEuLvkdwyducumu62w9k
         pX5+jBdrb/MKUyAMkaYoPXrVckeSU2y00NN0SAwRNX4b4i1h6I/DGRS9n5hW8AJ/T+9A
         sxpHz6TPF9N1uvPKRs70XlS17hhUN64f+POkB84s/YYfj97tpBtjpzJNEgKSIJoIuppm
         SE0+viu3o2Rbyf83YBA7ACRwhnvxzlS+2A+Nkltd3j2QBymDPtoDwcYbDpHeMsd9XvMd
         fgqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762246168; x=1762850968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vZzjlCCT3j9j2Nd7pQrTgnxvKhulGcz35Gruny6M5Bw=;
        b=siGUc8lNPFJxP0gvSUo/QVFWT9G0+c7AU5W00W5u8TOqcoNf4LWR6s4S95oEH9GQp5
         CRVfx+W5lbwoEuvP9LKYzdLz3oPoULAZwLxyt/YrIxel4+RxY3HYKN2kNekGHmX71smZ
         rc256UwMjPol2L1c8O5TEn1p6WGNu52At3tWnBRaV+t8MTMe7fxw2gVfrcFx6tpGZWnz
         UO0S+Ue6fauSMRWxErjq4gK83/zd+qtz53pArNf6uj7rPcCuwOKCDbvRuWib3Jvuu/qh
         lvLHFWXRTtszisLBS2L7eFaS4YdDbw+NwtYoQo3DgqMzRKOr7LLYfjpsbmjaKMbZwfO0
         OQvg==
X-Forwarded-Encrypted: i=1; AJvYcCU5FvFO+fBA52PzDjNi5/zUMDaLo7+74Monr71vTcYutStLg0eRdRi9vMTZk7XdWp4bO0m2hpX7y74=@lists.linux.dev
X-Gm-Message-State: AOJu0YwBJZD0ZemIKeJaHf6cphGdQdsx8Qd2OmzT2tMeuzi1YjLmspo8
	LGkdqK4HNRwiXs5TrYhlmmf/2qJCFZ4t7AKEgQClB3TT6vU6jHa9Wisf
X-Gm-Gg: ASbGncuvX9BFaRE1RBBNCTRds3jHUS4vOmNbytmudrkC+zWMdJe5tAtjFG7/nGwfJU3
	3Jh43Pmv0kmAn9sX1spA/2NONDGYRdjqwFvbUZwlZL7lIQGocwenFlXNEtb3VAaA5AmfzNDAvc4
	RjMdty5nGKKg8oJfizWYAcTiPu8artTqqb6IGFBQpqKbp5EE/3uEPIY3bmgZXhXJgBKGEIfkdmK
	Fi8m5N9Tgj1T4XO014uV1WR4qA2haYQz9F6ek455crM7EvxlCj6ScLadKS5zPm3AKCo31yM2eaX
	jHY6e1XbbPgzVJtzxSYzDRQgc49p1IbYjvGbTOTR8UZRsP956KoU9FM+F3sMkvkdrOFGK8tYUGZ
	Fq4fFhPmlNbedlyjktLK1CZcyF68RsXKODTUvSYUlxbnjjrHZcYcGNhfiBk+Gs3JnV918lQBRNr
	qUHU83J1dX+SRxm1rilhWEfA==
X-Google-Smtp-Source: AGHT+IEjMIiSe0x3JjyWJftYAjRTnLk4yj1+5guJH64mFdGd5LprT3gQcg1E9FYpKQf1UnNjUVPGcA==
X-Received: by 2002:a17:902:e801:b0:295:7f3f:b943 with SMTP id d9443c01a7336-2957f3fd4d1mr114855785ad.28.1762246167913;
        Tue, 04 Nov 2025 00:49:27 -0800 (PST)
Received: from iku.. ([2401:4900:1c06:600d:d663:3d9f:b9aa:53e6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3415c8b5cc1sm3692393a91.18.2025.11.04.00.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 00:49:27 -0800 (PST)
From: Lad Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: thomas.weissschuh@linutronix.de
Cc: Jason@zx2c4.com,
	agordeev@linux.ibm.com,
	andreas@gaisler.com,
	arnd@arndb.de,
	borntraeger@linux.ibm.com,
	catalin.marinas@arm.com,
	chenhuacai@kernel.org,
	christophe.leroy@csgroup.eu,
	davem@davemloft.net,
	glaubitz@physik.fu-berlin.de,
	gor@linux.ibm.com,
	hca@linux.ibm.com,
	jstultz@google.com,
	kernel@xen0n.name,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux@armlinux.org.uk,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	luto@kernel.org,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	nagarathnam.muthusamy@oracle.com,
	nick.alcock@oracle.com,
	npiggin@gmail.com,
	sboyd@kernel.org,
	shuah@kernel.org,
	sln@onemain.com,
	sparclinux@vger.kernel.org,
	svens@linux.ibm.com,
	tglx@linutronix.de,
	tsbogend@alpha.franken.de,
	tytso@mit.edu,
	vincenzo.frascino@arm.com,
	will@kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [tip: timers/vdso] vdso/datastore: Allocate data pages dynamically
Date: Tue,  4 Nov 2025 08:49:11 +0000
Message-ID: <20251104084911.6961-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014-vdso-sparc64-generic-2-v4-24-e0607bf49dea@linutronix.de>
References: <20251014-vdso-sparc64-generic-2-v4-24-e0607bf49dea@linutronix.de>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit breaks boot on Renesas arm64 RZ/V2H and RZ/V2N platforms.

The boot process doesn't complete anymore with no obvious error logs to
indicate the cause of the failure.

Reverting the following two commits fixes the boot issue:
  10d91dac2ea5 ("vdso/datastore: Allocate data pages dynamically")
  6a011a228293 ("vdso/datastore: Map pages through struct page")

Cheers,
Prabhakar
