Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B557123AD
	for <loongarch@lists.linux.dev>; Wed, 22 Mar 2023 10:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1679479361;
	bh=D20y0NYqchGWbF1Dhy/i8aRl2EvKrSL19JbLHjfCGfo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=PB6l/wlT/GCbOxxuanqXydpIwHeh/Ayq+wq7JSuKtf1bRTtjjZpZWaBInG/BL6PUi
	 crtJAco7IoPxYJmIZ2Z7pWYO/8odwUmXczw1/1hSX1G0NhhB32tLl2jeWs0ZeWVY9Z
	 trhiZi5m0LOrRW/COGc3Q9x00Sg8dIQUiSHqSD4M=
Received: from localhost.localdomain (xry111.site [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 6797265C77;
	Wed, 22 Mar 2023 06:02:39 -0400 (EDT)
Message-ID: <3421f5632586b932bd05df1021290ed7def2fe18.camel@xry111.site>
Subject: Re: [PATCH] LoongArch: cpuinfo: standardize the "model name" field
From: Xi Ruoyao <xry111@xry111.site>
To: Enze Li <lienze@kylinos.cn>, chenhuacai@kernel.org, kernel@xen0n.name
Cc: loongarch@lists.linux.dev, enze.li@gmx.com
Date: Wed, 22 Mar 2023 18:02:36 +0800
In-Reply-To: <20230322090533.4079453-1-lienze@kylinos.cn>
References: <20230322090533.4079453-1-lienze@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2023-03-22 at 17:05 +0800, Enze Li wrote:
> When I use the latest version of lscpu to check my CPU info, I see,
>=20
> =3D=3D=3D=3D=3D=3D
> Architecture:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 loong=
arch64
> =C2=A0 Byte Order:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
Little Endian
> CPU(s):=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 4
> =C2=A0 On-line CPU(s) list: 0-3
> Model name:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -
> =C2=A0 Thread(s) per core:=C2=A0 1
> =C2=A0 Core(s) per socket:=C2=A0 4
> ...
> =3D=3D=3D=3D=3D=3D
>=20
> Obviously, the "Model name" field shows me with a "-", which means the
> lscpu failed to retrieve the correct information from the
> /proc/cpuinfo
> file.
>=20
> The main problem is that, the lscpu only identifies the data by its
> "model name" field.=C2=A0 However, on the LoongArch platform, only 'Model
> Name' is provided, which cannot be accurately identified due to case
> sensitivity issues.=C2=A0 And I think that must be an oversight.

If I read lscpu code correctly, it also matches "cpu MHz" (instead of
"CPU MHz"), "address sizes" (instead of "Address Sizes"), "features"
(instead of "Features"), "cpu family" (instead of "CPU Family"), and
"CPU revision" (instead of "CPU Revision").  Maybe you want to "fix"
them as well.

But this is just strange: both "CPU" and "MHz" are some sort of
abbreviations ("Central Process Unit" and "Mega Hertz") so why "cpu"
should be lower case but "MHz" should not?  And why "CPU revision" but
"cpu MHz"?

To me it's a util-linux bug.  Can you report it at
https://github.com/util-linux/util-linux/issues and let's wait for the
response from util-linux maintainers?

> This patch fixes this issue.=C2=A0 With this patch applied, I get,
>=20
> =3D=3D=3D=3D=3D=3D
> Architecture:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 loong=
arch64
> =C2=A0 Byte Order:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
Little Endian
> CPU(s):=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 4
> =C2=A0 On-line CPU(s) list: 0-3
> Model name:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 Loongson-3A5000-HV
> =C2=A0 Thread(s) per core:=C2=A0 1
> =C2=A0 Core(s) per socket:=C2=A0 4
> ...
> =3D=3D=3D=3D=3D=3D
>=20
> Signed-off-by: Enze Li <lienze@kylinos.cn>
> ---
> =C2=A0arch/loongarch/kernel/proc.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/loongarch/kernel/proc.c
> b/arch/loongarch/kernel/proc.c
> index 5c67cc4fd56d..7da56f9ee15c 100644
> --- a/arch/loongarch/kernel/proc.c
> +++ b/arch/loongarch/kernel/proc.c
> @@ -50,7 +50,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0seq_printf(m, "package\t\=
t\t: %d\n", cpu_data[n].package);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0seq_printf(m, "core\t\t\t=
: %d\n", cpu_data[n].core);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0seq_printf(m, "CPU Family=
\t\t: %s\n", __cpu_family[n]);
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0seq_printf(m, "Model Name\t\t:=
 %s\n", __cpu_full_name[n]);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0seq_printf(m, "model name\t\t:=
 %s\n", __cpu_full_name[n]);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0seq_printf(m, "CPU Revisi=
on\t\t: 0x%02x\n", version);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0seq_printf(m, "FPU Revisi=
on\t\t: 0x%02x\n", fp_version);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0seq_printf(m, "CPU MHz\t\=
t\t: %llu.%02llu\n",
>=20
> base-commit: fc89d7fb499b0162e081f434d45e8d1b47e82ece

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
