Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795178204;
	b=QTvwO3TrBQm1Wk62dSXBQN+ItwGnOTfkDRqV2ZIl4/jrOz8BeT5DeskgcqPNQmUWLsQZ
	 vAxFKeYF6XxUL9Oo56k59/97xKtnYrsDREU+o+Kl1eDGBKczSVk6jAdVsMBCsIiGxoO8X
	 BS7el0Nr7a1TaUOzNByGN/e+ag9RmWbLtyEA2wr/1/3qQp9nElAe7Kssdk3+qx29E/9NZ
	 jfaelTmjSYN7XojShnCD18CiRqkt8wzj/W5707CFAAJChrngzsv2vZ7mGeMrJTIRK5ghE
	 KYNQbgzGyhQ3Nvvq1nZyIUSaEPcv88wVT8fE0GqQSVemsLhvW/BXtgUV9/fzSkJ1ZAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=WeOrsjpJfRBrNwFvy+AQY39SEDxtlUWfYfyLARDn2qU=;
	b=poV5KGcIa6k4Nw/MNRwLdNjRaNRx2MA0qWe90oPKToJ+B6eyUa6gyOYdGPqtYD2rZdHG
	 pLKWT8/uWAZm3igvlt2acADCbrerU3iRpDelker8LB+tn+rkNSz3WKyMOoorW39WjHEUi
	 2giOhdH7lju8F7S0JCNx1mRw95o3tmHBhsOrFQZJNUUGNxNY3vTA0EcPy3AoSRQslH5in
	 ZiCEflu1RiGY+VHmJeSUSmK1vXXiw3r+4t6NJTk+sRcRbDahU7sczu05pFRN9cO6c04+3
	 2VrhfN8YrDINbsmA6gfsgbmrYoWZjFt0SsLW2/QYVoi+R7Ic5HhUinn+FcsrCZfD37g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=ZfR0En2u;
	arc=none smtp.remote-ip=209.85.222.52
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97799606A32A
	for <loongarch@lists.linux.dev>; Fri, 20 Nov 2026 12:36:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97799606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=ZfR0En2u
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-9912c47367cso501374241.1
        for <loongarch@lists.linux.dev>; Fri, 20 Nov 2026 04:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1795178202; x=1795783002; darn=lists.linux.dev;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WeOrsjpJfRBrNwFvy+AQY39SEDxtlUWfYfyLARDn2qU=;
        b=ZfR0En2ubcfpFABm5StZohuuQ1dq3MZWKIjkt2gZLew37FFPlJGf1/2CtPzkFcRE0h
         OJOXsJTVNI0gwlcanT0HE3CalQew59GG+p9Qni5pM/lQceG15snjg2manIvhkPO7kEqT
         AAJvLt4KEVPSrmH6bfkUeSjkyCwylKKY38np8MbPxXcXWQHHrCa/lfXq9tLiAJDYj3lP
         C/vIqMp7ZtxogEY5rhW0AgTdpqEjbVgApd1m5WuLqQXmbr3qczfE16f15GWrIZztEgwZ
         7TdWi3EnYaJXq66Ey3WyVByT0EWCTwh3zzaS94s8Na6nNYkAlXLi/zCeNTEAAtxLz/c1
         SmVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795178202; x=1795783002;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WeOrsjpJfRBrNwFvy+AQY39SEDxtlUWfYfyLARDn2qU=;
        b=PfgiFZ7xmw09PQd3B0f+KD4nECY6bnurTJqY4IkR4P6tccIIsXxNoGNJJeb4ztcOsE
         rW4AQTGxwvQn2QjDehfN6wfZnmZ3e0S0BsajvwK1oHHSaRmqCwSkFd4XXYZNVn2BXXc2
         WuMOI9LIxfilPxTh5O4C2mOo+jhIzuvEZyNSUeok+55CK7WnoYkPnM2SvOXpQd5jwjGT
         ZBUxIemtV5UNig4goNRB30BhIm6Od/1XzepKK4eZSdpEgOHlsnjkZq5s8mnd4PNSldur
         kKobhsLOGQBGOQ8eQ8BlFCh8Pcbfmqz7lEl7m3wzfVnz7e9Usl2ivVX6PbODO4GEW26o
         +5tw==
X-Forwarded-Encrypted: i=1; AL+hErF5mGaUIdH/VeWNSradUrpSFZilR00NnufFnlobIaeYuKN6b18R+Gmj508dBNFdk2Xsgr+OtnPtyTM=@lists.linux.dev
X-Gm-Message-State: APuU4Z9YXNE08BfCG78A3QASZnf2kE8c/NZ8yS2P288Srzod7osONwXH
	C5wMefporLd+z9IrEeSCsiG9bPST4yp2DHVL6m3CCPjwGxoYm292Rr5zK2c+RVaM2Ro=
X-Gm-Gg: AZFdTZd/CI6oI2J3iQyFIqYzyqB4Su4Dn3VAEx68hp4+BT6IIlvWHNnumpTj9gdrqZd
	e0N9bZcc5P3qBUpDBaWAbhOKcr7a5ce0ZuaIU6AEhJMJrXGrwmgmwdEJcL2VIM5yTuAWr3OR5HD
	6FjOmBYPwthQvURtsYeYZBSnq6VO24JfHHCv1HAE0C+TfWNP8RzDNv44SrskDm2zcWMux7tSiIk
	QcWOPq52KrITRTdh05yS5kx9xhHeWKek2BP28XC1xTDr/LIj+X1oaebvCnkTqLaDxnhiy2A+DLy
	IR1/vTf6XJIrIBCld0IU7nElD2LmCLHwdJYSHaW5jVkeNvCO/rxJGhixFwiOQ40vFiUZ5+HYRAC
	s/Uz9F8O22H3jTPFFg1bAjunZvY8ArXsCz4SX+vwa2wKAxs72n7dNwWRIWoc1stotmd7PXT3mW7
	uUhzINhsCPD7pDBQjMPckbgkKIxziLhQE5bp8u8opVEcNj9hrLVV/SlCEhWkru8bQhsM0I5AzFj
	JT1Fee9dYeuBwaWnrUJNnkgBlMMFoSP/91ZEnQCyKBu3cU7P62/pCo0WCfdhLmU7YdWFKGB6cwg
	FMRRGkEGME2VGRYli/q7Kfizwd9VHGa8FgKUumLLmSVhwFUp63dMJQ+Dj1UOITlcV+lbmYQ8Rb6
	tczPrg5tROjIpT6ZVhHiDjrma56PdBsxqydI2JE1p7kdOYA4=
X-Received: by 2002:a05:6102:6441:b0:7cc:905a:331a with SMTP id ada2fe7eead31-7d739660c9fmr746735137.14.1795178202521;
        Fri, 20 Nov 2026 04:36:42 -0800 (PST)
Received: from soleen.c.googlers.com (57.233.150.34.bc.googleusercontent.com. [34.150.233.57])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e80cb440sm2765262137.7.2026.11.20.04.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:36:42 -0800 (PST)
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 0/2] arch, kexec: declare kexec and crash capabilities
 in Kconfig.kexec
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Baoquan He <baoquan.he@linux.dev>, Borislav Petkov <bp@alien8.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, 
 Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, Paul Walmsley <pjw@kernel.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Rich Felker <dalias@libc.org>, 
 Russell King <linux@armlinux.org.uk>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Thomas Gleixner <tglx@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>, 
 Will Deacon <will@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
 x86@kernel.org, Alexandre Ghiti <alex@ghiti.fr>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Cong Wang <cwang@multikernel.io>, Mark Rutland <mark.rutland@arm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "H. Peter Anvin" <hpa@zytor.com>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, WANG Xuerui <kernel@xen0n.name>, 
 kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
 linux-sh@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 loongarch@lists.linux.dev
In-Reply-To: <20261119-arch-kconfig-v1-0-37c276fe4d26@kernel.org>
References: <20261119-arch-kconfig-v1-0-37c276fe4d26@kernel.org>
Date: Fri, 20 Nov 2026 07:36:31 -0500
Message-Id: <179517819160.302903.17107992182494080507.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=279;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=6sWQl9lmqjTJk3yxh91YK+fuuFKvUf1mQEwavRJAVng=;
 b=owEBbAKT/ZANAwAKAbt3KEzbc3reAcsmYgBrAD7YSNYHVf2cFGXSq25iXRKWCRXN4f0ixFmnf
 ++ItKpA2qWJAjIEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCawA+2AAKCRC7dyhM23N6
 3tiPD/d31VAJSvGrL/uVfmPyx9aQ56Xv29nKPQ6VnqwxP+xMB94zunEWD8SU+Mc33Jsi99L7q8T
 EfGGkXbTCSoGd7NQv3bSnhUhMQVXfpkd18XOnWbNd0iZdBWi4KwA6+/bOhxsYpO/vNSV52HyHUl
 YH2tsnNB0E6EUN5P7dsJ2PqcWD6QjGrbW/xN/5ItrxWqVXu7AFWAGG87321F8utMVUAjMd5pbNX
 gMmicb9aVIU7JY8k0q7PhcEcRAKBjeq1d52NlSDCQyaltHTGY5+29RgVN9juLHJk/Aqy3s15ERG
 gm7x8LUDOEKOpRB5wWYYeKgpWsUscytR/AC4OBQTujXKhQIWBnWrzxr6tjgdacQJt/i9O9RHd1G
 2mft4ocO42XqcRceZtQr6UzRDuVwoDTDwn7Tgr1GRPVmpKWKbzpatvf9WPoIEE1p4+zITr10dGz
 r/38wDLPSJghOgD31RGTysREDXP/fCAYar6DdmmMDK63vuMssMRCUOe16Xd0DOIZIG4FAZ7iix4
 P8e8ny0z7tfxqx4vm+6CsIaWgFvVAxYu7Aw1xAruadzsWe+u5UqQLLBY6z+0k76JoRaBMkkcS25
 JEuj8uFaMFXD2ei4JRlUNt57apqgQNCbvhYb6KUTHwP7pocn/UNfKH5JCi9KQCFr7OzuMoLGVJq
 hED2RJ/U2jV7C
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

On Thu, 19 Nov 2026 08:16:56 +0200, Mike Rapoport (Microsoft) <rppt@kernel.org> wrote:
> arch, kexec: declare kexec and crash capabilities in Kconfig.kexec
> 
> The intention is to take it via kexec tree.

Acked-by: Pasha Tatashin <pasha.tatashin@soleen.com>

-- 
Pasha

