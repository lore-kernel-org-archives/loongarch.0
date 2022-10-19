Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF7B1FC9
	for <loongarch@lists.linux.dev>; Wed, 19 Oct 2022 04:13:18 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id s196so13857000pgs.3
        for <loongarch@lists.linux.dev>; Tue, 18 Oct 2022 21:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=05myh31oMr/q2J5BJn593JOYwoX0tzfWg7ohUct7D5A=;
        b=YflIaczlCY9WKyaxEUxTSTFp5SQEgE5/lvpGzv1EJ0s5GzPMCU8/P/5D9c5NyhXp8J
         2DRhFvfOZviWnm3Zsx1lrqhtLuHKljlI+Ws7xMW/wLt+8b9HNRXrBB+KO9mHtbA1kgqu
         ECHd88+a1WZC6moWpAElwy2ZxE9VAaMYo2R17vybtNPYlM2usvA9FBYzO6OHasjNE+4M
         01+Q2STtfAweZrTYPBwxX1E9jZ8UrSIxp00BH3bJYUlmix2h+aEIgN/H5Zcvu4tKpWHl
         PqaGtufpb94uXGiJVukXkkWx2UagdF7byTQQjq/0vWmWTojIlGlPgyUy3ZiQ52xYwhfp
         K+Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=05myh31oMr/q2J5BJn593JOYwoX0tzfWg7ohUct7D5A=;
        b=o8dtk4egZV6LxK4EskS0EFukOvk8Psy45U5iR0EdEPbs6XUeHm7elDU13mJj3BpL2l
         odPwa63VykBOEcarT6Nsg/9OiaSpK+P5WaX4GOD94GVIfYPzkLSd5vunvzbepPZFPGuT
         r79A6Yc0izgZFh3CmrLAfocIp9OaEApFT6UQxqqtQG8IqYIY9YS2IU3Chzw5R4fJUYrP
         ilBw2oINcKX/z+Uno7PDKXnwzPIvaTVcIgBXjFs/EZv2SVfq/Lqc6KyaJKmXrt258j3S
         rhUkZpUOUY3v7gD3Zv6H7I682tjfbhQvF8RZYhmTtKC+tb2eX0rxMdYgM95alVEtyT4/
         F/Uw==
X-Gm-Message-State: ACrzQf0PZ57ujY93WNbH184szKiR6QHnnSBl31w0K3aTpMXnAq9RYHtt
	vuLY0+1TkFO9dYgLC8zI8nc=
X-Google-Smtp-Source: AMsMyM7PVGan+RHqzkCNfLmfIEcYPPU2SCyyNgOkjvyGlZJSW5qSXCZKTGjoqhBy2dUk+F703Q87Fg==
X-Received: by 2002:a05:6a00:1884:b0:562:6536:4844 with SMTP id x4-20020a056a00188400b0056265364844mr6639752pfh.2.1666152798231;
        Tue, 18 Oct 2022 21:13:18 -0700 (PDT)
Received: from debian.me (subs03-180-214-233-77.three.co.id. [180.214.233.77])
        by smtp.gmail.com with ESMTPSA id v3-20020a170902e8c300b00176b3d7db49sm9578499plg.0.2022.10.18.21.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 21:13:17 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 709A41012EB; Wed, 19 Oct 2022 11:13:14 +0700 (WIB)
Date: Wed, 19 Oct 2022 11:13:13 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: WANG Xuerui <kernel@xen0n.name>
Cc: linux-doc@vger.kernel.org, WANG Xuerui <git@xen0n.name>,
	Huacai Chen <chenhuacai@kernel.org>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <siyanteng@loongson.cn>,
	Jonathan Corbet <corbet@lwn.net>, loongarch@lists.linux.dev
Subject: Re: [PATCH 1/2] Documentation: LoongArch: Document the syscall ABI
Message-ID: <Y095WSk6brB2li/O@debian.me>
References: <20221018100457.3440691-1-kernel@xen0n.name>
 <20221018100457.3440691-2-kernel@xen0n.name>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pP58CdA786Rjnrv3"
Content-Disposition: inline
In-Reply-To: <20221018100457.3440691-2-kernel@xen0n.name>


--pP58CdA786Rjnrv3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 18, 2022 at 06:04:56PM +0800, WANG Xuerui wrote:
> From: WANG Xuerui <git@xen0n.name>
>=20

What description?

> diff --git a/Documentation/loongarch/syscall-abi.rst b/Documentation/loon=
garch/syscall-abi.rst
> new file mode 100644
> index 000000000000..6f63aa3cfc64
> --- /dev/null
> +++ b/Documentation/loongarch/syscall-abi.rst
> @@ -0,0 +1,36 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> +Linux/LoongArch system call ABI
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> +
> +This document describes the system call ABI of Linux/LoongArch.
> +As the kernel is 64-bit only for now, the description below assumes an L=
P64\*
> +calling convention.
> +
> +Syscall numbers and parameters
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> +
> +Like with other recent architecture ports, for the most part Linux/Loong=
Arch
> +reuses the asm-generic syscall numbers and parameters.
> +There are a few points worth mentioning though.
> +
> +* There is no ``renameat``. Use ``renameat2`` instead.
> +* There is no ``getrlimit`` or ``setrlimit``. Use ``prlimit64`` instead.
> +* There is no ``fstat`` or ``newfstatat``. Only ``statx`` is provided, a=
nd
> +  low-level components making their own syscalls are expected to be awar=
e of
> +  this (and provide their own shims if necessary).
> +
> +Invocation
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +System calls are currently made with the ``syscall 0`` instruction.
> +Although the immediate field in the instruction is not checked at presen=
t,
> +it is strongly advised to keep it zeroed in case it is to be made meanin=
gful
> +in the future.
> +
> +The system call number is placed in the register ``a7``.
> +Parameters, if present, are placed from ``a0`` through ``a6`` as needed,
> +as if calling a function with the respective arguments.
> +Upon return, ``a0`` contains the return value, and ``t0-t8`` should be
> +considered clobbered; all other registers are preserved.

The wording can be improved:

---- >8 ----

diff --git a/Documentation/loongarch/syscall-abi.rst b/Documentation/loonga=
rch/syscall-abi.rst
index 6f63aa3cfc64e5..d05fa2e0211bbf 100644
--- a/Documentation/loongarch/syscall-abi.rst
+++ b/Documentation/loongarch/syscall-abi.rst
@@ -5,32 +5,32 @@ Linux/LoongArch system call ABI
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
=20
 This document describes the system call ABI of Linux/LoongArch.
-As the kernel is 64-bit only for now, the description below assumes an LP6=
4\*
-calling convention.
+As the kernel currently only supports 64-bit LoongArch architecture, the
+description below assumes LP64\* calling convention.
=20
 Syscall numbers and parameters
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
=20
-Like with other recent architecture ports, for the most part Linux/LoongAr=
ch
+Like ther recent architecture ports, for the most part Linux/LoongArch
 reuses the asm-generic syscall numbers and parameters.
-There are a few points worth mentioning though.
+There are a few limitations worth mentioning though.
=20
 * There is no ``renameat``. Use ``renameat2`` instead.
 * There is no ``getrlimit`` or ``setrlimit``. Use ``prlimit64`` instead.
-* There is no ``fstat`` or ``newfstatat``. Only ``statx`` is provided, and
-  low-level components making their own syscalls are expected to be aware =
of
-  this (and provide their own shims if necessary).
+* There is no ``fstat`` or ``newfstatat``. Only ``statx`` is provided and
+  low-level components invoking their own syscalls are expected to be aware
+  of this (and provide their own shims if necessary).
=20
 Invocation
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
-System calls are currently made with the ``syscall 0`` instruction.
+System calls are currently invoked with the ``syscall 0`` instruction.
 Although the immediate field in the instruction is not checked at present,
-it is strongly advised to keep it zeroed in case it is to be made meaningf=
ul
+it is strongly advised to keep it zeroed in case the field has purposes
 in the future.
=20
-The system call number is placed in the register ``a7``.
-Parameters, if present, are placed from ``a0`` through ``a6`` as needed,
-as if calling a function with the respective arguments.
-Upon return, ``a0`` contains the return value, and ``t0-t8`` should be
-considered clobbered; all other registers are preserved.
+The system call number is placed in the register ``a7``. Parameters, if
+present, are placed from ``a0`` through ``a6`` as needed, as if calling
+a function with respective arguments. Upon return, the return value is pla=
ced
+in ``a0`` and ``t0-t8`` should be considered clobbered; all other registers
+are preserved.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--pP58CdA786Rjnrv3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCY095VAAKCRD2uYlJVVFO
o5fFAQCtJdqR+Euwsb9nvjdIt/dLpS21ZxAQz6P2lyHgYsLqEQEArJcNI2Rd6XJ7
vDMZn/Jl/mZrA7i9pOweOtD2NlRm5gg=
=3HRU
-----END PGP SIGNATURE-----

--pP58CdA786Rjnrv3--
