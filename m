Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795316692;
	b=cDG96vVaIvH9CMa+T6liBqn4SIVPPY5L1wUalkyQAhtJXKJrwydYx6Tkm5AWasBgDMYA
	 X4YBJk3qvjq8dqpFiKDmblbfQJwE6OGuhuwJLfZ6lo5Jo5ZdKRNmcz21hQ9cKuCnjho3f
	 U6Vmtg7DYB0gaJMRL5169ejPOjpy1lYSB8Z0CIiLZFFKfSBmNDthrsw+gjokqZrhg0nDA
	 bl0G2JNdsZa0dftMEilVfZJBQqSBIHjE/gxKgwaV/KxAH+Zacu7MD0P2xQhGJTrPAa188
	 k2CPlW/wr/eBwR0O/OYUDup/sobgKrgKLaEzmjeOdhDbyb80+6DApNW7TJnhyrOKMOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795316692;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type;
	bh=NieCLCvG+gDw8VjVQsEmj+Xb3Nuvde1xSdj6TYYBmIA=;
	b=VV1ap4dlR6izinAQWed/bKA8RwAJmCJBGDiC0XYevjOs5fbvWuV+z+dretaCv+mVzNY2
	 hGPkWDQ2PQeM3v2/LB8Mwwx/FC42bTi/MfnXBiQJLvqkpdNpmsOHwuNJ8OocqMAZL22a3
	 4zyHznK/VWF/uS1X2bPBLzDKxs0Cxwn9tqpfAI3y5I0ntjN75bn02zrgh69HSuNtfAWLP
	 Sx1UvsdYhAK4JTHZ0vkBz6YSiIt4tdSiHk+bL9o3wE6+tvNp6oNH4269aph7laEzoTZwM
	 KNn7n4islDVTzE2lnow6Fk3t5xFSzPdaMTDVRLS6ObWww/H/RWqpsqzcBkdVsO0cDcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iOpDhYR4;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF17606A331
	for <loongarch@lists.linux.dev>; Sun, 22 Nov 2026 03:04:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CF17606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iOpDhYR4
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-38564b4b017so2258382eec.0
        for <loongarch@lists.linux.dev>; Sat, 21 Nov 2026 19:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795316691; x=1795921491; darn=lists.linux.dev;
        h=content-type:mime-version:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NieCLCvG+gDw8VjVQsEmj+Xb3Nuvde1xSdj6TYYBmIA=;
        b=iOpDhYR4MTQOrdXk1PK5dVMTHMkqfEp006EuAzL+oin4Cv4+VxzXDL9AcBZDrhm4gJ
         o1DAuBdNaOIaf+OCvJoNEZxTT5yQQ7TU5H7zDyvVDZjjinNow8xxsYZhZhLy9qAvBLta
         raOnU8b+Gy6loBFNmXT2bnhvnBjsLAm9eFn0wzmCi1ValDmZyxA2z1yui83fyGMg/sSI
         PThrHXneSLq8NM/6Tq69VYuQeffhRTC39KtvA2HbZKauJhUEEQnQteLkwrjw8oSq/Tk5
         QM8JuESVBOv+0YBNpq6wPLpDBCdetkPitvQyer0lhVx1l9jyZwZemWepB+Qfjd2T8SOT
         touQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795316691; x=1795921491;
        h=content-type:mime-version:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NieCLCvG+gDw8VjVQsEmj+Xb3Nuvde1xSdj6TYYBmIA=;
        b=1kZ35VL3AN6smm4IWfBzdYlFi3b7dNLhlXkFD89Ks/zo1uTn/ZQJYK5erIPhdVAiMx
         WrjhQL9Qd+An9vxPAuIaIwptLU9XphAUJ1uHTbWgu1H/N7+O9nAbNczX64e8UhBrAoVg
         78bPgqeFZFUKmF2X55G24yUKszlUq1JEeagz+g+a2jo8Ut3gq/Q8f52OK0RbntSGYh5A
         C/IvOseISnpI6Y+XCnc5zufCkdWIbHgwGAYyM8HGX/BbuZDv8svmJ6UTWKIdssi51sDk
         y+2Z8G7JLwdEUk+lHKOfxZ3aWqQ1LG+SZKAj0ZNtk9TSf09Ieew/WJNo22A78WVa79ag
         rCRw==
X-Forwarded-Encrypted: i=1; AL+hErEfNshbBP0tMRFnjbjXsroOBljyEWZg/y9Kz1xEgZjMlOBbTaKgi2tytq4WBUT2n7knIf6vlT1fFvs=@lists.linux.dev
X-Gm-Message-State: APuU4Z9I+Z+z7l6pVuZlnSd5OugC4wJAwxl6OED8p1eJh9AG1gSI8+zg
	OgsXjcTwBwclhB95zBGwsftMOI1VTVlWxERhu5IuySVrCSAkf6IbhtgmXKAW6Q==
X-Gm-Gg: AZFdTZcTxa8KC4UW4iT/1OEyFiCUcs3KYjVzbNIn4v8rOwgrch/Ya/A7ta4213FvN7i
	8bz3f1xFI/1+wfM9PzbAYsbfhvpuk5QZEWHmY/spa4BQURRdKnDG9g5z9VtASBUFjgo5ikYHcU4
	8163xmLVdNcHDPFmCaxQr/h0coIkKzmg95IDyTO7+jqjuFpSUxbloZcl91zQCbRPK32Y4eGfzhp
	/wHe1hbAHUnOI9MlePp4uS4uSDLjMJZimVmdKXlSwyHM295GKW7pysAhytn+q8pxouUM3+xuO4M
	fn/pihil0uwrowJpm0tnf12o/xZksrt04BZk2VQCh0VEmpSwDLC3qW7DUp66dVPzcJ5u6yKLpI5
	fayP2JDxhXGmgBghhAh3z/NCrwoi2eGf5Xr2fZ54cYRRB0k44zsRsFl5BD4kVnseJ323jpF8Xyl
	y9K8QUUH3bUP83lUhp2iSjhLE0WQbjhd0GomcwhK0WSNkGZLGI5vYxtd81UP8SBBbWLAXzQl0gn
	56qOj/vMvEWxdWO1fQfkkEoqv9u82HimYivSmRoMglEdLpmkG3XFfhZq+nfv5Cfsn6Ahweh4iyG
	8+EIXPIExEhziqamcgXBlvHbtmT94NX4cZHRbyKOOJITyvw+
X-Received: by 2002:a05:7300:50fa:b0:383:9f52:e54d with SMTP id 5a478bee46e88-3856ff52e83mr8869235eec.8.1795316691531;
        Sat, 21 Nov 2026 19:04:51 -0800 (PST)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm24302948eec.27.2026.11.21.19.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 19:04:50 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Baoquan He <baoquan.he@linux.dev>, Borislav Petkov <bp@alien8.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, 
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Paul Walmsley <pjw@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, Rich Felker <dalias@libc.org>, 
	Russell King <linux@armlinux.org.uk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, x86@kernel.org
Cc: Alexandre Ghiti <alex@ghiti.fr>, Christian Borntraeger <borntraeger@linux.ibm.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Cong Wang <cwang@multikernel.io>, Mark Rutland <mark.rutland@arm.com>, Michael Ellerman <mpe@ellerman.id.au>, Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, WANG Xuerui <kernel@xen0n.name>, kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev
Subject: Re: [PATCH 2/2] arch, kexec: declare kexec and crash capabilities in Kconfig.kexec
In-Reply-To: <20261119-arch-kconfig-v1-2-37c276fe4d26@kernel.org>
Date: Sun, 22 Nov 2026 08:33:10 +0530
Message-ID: <wlq5k1ox.ritesh.list@gmail.com>
References: <20261119-arch-kconfig-v1-0-37c276fe4d26@kernel.org> <20261119-arch-kconfig-v1-2-37c276fe4d26@kernel.org>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

"Mike Rapoport (Microsoft)" <rppt@kernel.org> writes:

> The options that let an architecture opt in to kexec and crash dump
> features, like ARCH_SUPPORTS_KEXEC or ARCH_SUPPORTS_CRASH_DUMP, are
> defined in each architecture's Kconfig as def_bool, and most of them are
> copied over several architectures.
>
> Declare these options once in kernel/Kconfig.kexec next to the options
> that depend on them, similarly to how mm/Kconfig does it, and make the
> architectures select them instead.
>
> Selection conditions are preserved, so there is no functional change.
>
> Acked-by: Baoquan He <baoquan.he@linux.dev>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

No function change observed in this patch (as described in the commit msg).

LGTM, feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com> #powerpc

