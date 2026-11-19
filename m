Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795073403;
	b=3rkiJnkhmER49Y7gilI5M8txLEGfEdoVmoF53AGItRTwyRuM5ufuMD9OBsWW5D5CUcoq
	 djlyu5P15IWwRBarD8GbhcwJF7QY/yUhVcWrVDoxrUiYnrsYrYAxqH1nEYPNDHERXixr5
	 L9N7yZMRPSKdwSKr9A6vQ7GEJYrFV0QX2+w2ui3FKbK+GHhYI3DXvb1ibcTkjPYva0msY
	 Bmf6rkon5YJnc82QqtXBVNVIiCN0J0JxRtsFy6P3893DZVRFXFZmTxuCOB9VBMC0XghsW
	 TjzgtviTn9huj5shf646bhWDBeNMqUL4SWjtruQBtGCWfviKLLLOctQwtvofqgGikFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795073403;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=Klcqtq67J8++CxJ47wWJ4KmRtmeIU5oN8tRyALYYbAY=;
	b=wRLf9+O4XKDYrtnFQpKvnU+63acB7wmNTuLgWumta17FW/iZg0II2UsnU1lu5pMjalzC
	 8Jw6yz/2Mlx69/hQAslazudSjFwc6Zv2nRqZ5aAAWuZso1BQgN/dtU0DJ5duLRcqiTobi
	 0Y4aqlYqJ5E1PuN/F50hubLiMLOrST35NKynA13A83eTekCDDhWIYyMh6d3f1/ecJr8m+
	 a0L43U9L8RpCuc0P1ejgOnV3B4NLZXXRzPKWUggl335Q9oc3bUXxXevstb7vXsj87d5OB
	 RVLpSUwU1HB2pUIBuf0aIKARp3k5WqJbJYj4lMjeVB638TDb6mxvQp2aH/ki7Du+u6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.51
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA57606A32C
	for <loongarch@lists.linux.dev>; Thu, 19 Nov 2026 07:30:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CA57606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-98301b325c4so632292241.1
        for <loongarch@lists.linux.dev>; Wed, 18 Nov 2026 23:30:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795073402; x=1795678202;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Klcqtq67J8++CxJ47wWJ4KmRtmeIU5oN8tRyALYYbAY=;
        b=wqiDOrRDiaDLRA01cfdxqkzRFymgx9pqN9OBONdyNS5uaUVTHovhKANdfidX1rE+hw
         kQGKw7ksjUBXgFILq8XP5nLB6jVM5v5Fr+EIeVXR+9hupDRvmtmIPcd3YL7tG1/u3hFE
         j+bQahqloGmAIPB8J8KRdaCPgw/NkH0lL1GsdGc52GtyJvjtNDildMzWA/byhqYTn2Gm
         UC0XcjNK42/A2kkOHS03ZD2hRFHD64JIWjr0gHpQDuKJUjFWIcl03Epj6ibTa6hcs/7G
         sNr4RGuVRUp5z/wYfpWh6f0qgVFW03eA8RcjL4loqMG8vRZ5uykvo34OXGUrKBxQBp1p
         zvEg==
X-Forwarded-Encrypted: i=1; AL+hErFX3C6rSoxurKYyuxUbbI4vY/CqRZ+70NQ1F+5CtbByehYHJlccnzaM++qQUADwGJjrzM0GzN1xb5c=@lists.linux.dev
X-Gm-Message-State: APuU4Z8+Wx5GGFJAXFW/Gr4NC7ehPCEjs3xVLfahN0qobHo6YMOOZ4YF
	9D/38vlWt7PLbaEVO5UwSCBln6GON6Oy6xW/QTJDFeMZA/hTbldoiBYzkkGS71RI
X-Gm-Gg: AYBFou2MbFjJjh7WMVw2b+/yatLSQLNJTjHvO2Zm69lTAW6huS2rkZLOADNeI2OdLlq
	RKh4rtC8Y4IGCy9RB1DMKcwMdL0XOVF9FdksMzfTfQ9pOxZqVq9Y5YytR8DR00POHTH0BGQdiTo
	SUV7xcgkcz5hh+JviCpK3RXIM55ZEljKnyw36VzhCOsU6XLaCYzXgLfajItlCJvhyk3xhxK9tP0
	uosGuu/+NJzq3zKTWnHaZ5b9+LSOIwlgEKyITgxJwXdrAyUd3buB+Ij0sin5l27RGgXnPcotulP
	YWc47jXSSK/sEF+uHLBaCNNF5EF6Du+cEJToCLVAa6Wl0jugu3WQQvAZsLnNIiZkZ6eyeOXXnXc
	phF/lWE1qq3bTkp1CvrEhtqKV5oHRqu208AFKsJEdkBspaKiZQtKTOJRiCPUWLwIsGxEqQkDJoE
	QhmlpYYSTPJA+4T46NF8xxzfjEO4/ZVIwJkWfeOXDcXWZHD9gKz3VFEemn4dLeIYgsCKtVl/Iho
	bRwYBJe1km+Z8+O9DCeta63nDajt2OPEY/b5VAcxL+9euXo2HfcPqgikuZUxI+cNBUiF8z3TNiq
	fdiJIFifTTqdM7ub+huCmUbXA8/crPNnh6Cy/7RPCnvf0xLveKUcKVCadTfv6FEfjtQ=
X-Received: by 2002:a05:6102:418c:b0:7d2:9cb2:88 with SMTP id ada2fe7eead31-7d6ba461359mr1850472137.32.1795073402168;
        Wed, 18 Nov 2026 23:30:02 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6b9185bc3sm3617944137.5.2026.11.18.23.30.01
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 23:30:01 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7d2db1b9bf2so599606137.2
        for <loongarch@lists.linux.dev>; Wed, 18 Nov 2026 23:30:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFAq9MGx3wHcxoM3kuwW64Iskaz3K7jQJSCOYKy5OWxX/xmJCPWsyfHD3d9beXltph5dnrZYQ1gQWU=@lists.linux.dev
X-Received: by 2002:a05:6102:e0c:b0:7b3:8f0a:f76c with SMTP id
 ada2fe7eead31-7d6ba35b7d8mr1806982137.13.1795073401089; Wed, 18 Nov 2026
 23:30:01 -0800 (PST)
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261119-arch-kconfig-v1-0-37c276fe4d26@kernel.org> <20261119-arch-kconfig-v1-2-37c276fe4d26@kernel.org>
In-Reply-To: <20261119-arch-kconfig-v1-2-37c276fe4d26@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Nov 2026 08:29:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU2u9wDiqp+H-aDWSRcT8_VtDg1NS0gVmqYYm9rt2ZSrA@mail.gmail.com>
X-Gm-Features: Aa3M54rf5ygj8ORK3fy8Y6Bg5UcrfzvYekQ-eoJmIgxSYs0ZeBrecHV4-2jERSw
Message-ID: <CAMuHMdU2u9wDiqp+H-aDWSRcT8_VtDg1NS0gVmqYYm9rt2ZSrA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arch, kexec: declare kexec and crash capabilities in Kconfig.kexec
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Baoquan He <baoquan.he@linux.dev>, 
	Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Paul Walmsley <pjw@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, Rich Felker <dalias@libc.org>, 
	Russell King <linux@armlinux.org.uk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, x86@kernel.org, 
	Alexandre Ghiti <alex@ghiti.fr>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Cong Wang <cwang@multikernel.io>, 
	Mark Rutland <mark.rutland@arm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, WANG Xuerui <kernel@xen0n.name>, kexec@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 19 Nov 2026 at 07:17, Mike Rapoport (Microsoft) <rppt@kernel.org> wrote:
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

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # sh

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
