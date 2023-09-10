Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE6A7484
	for <loongarch@lists.linux.dev>; Sun, 10 Sep 2023 16:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1694362078;
	bh=DW91I67iAxIHl7zHxSTQqKP8QjpT1+l9zDAYPBbB80Q=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=l1DZFW7YyyGAS28jsjUFTN9JuyvS2QpHSJDSmn58nxs4eK+nJH6OGXpuqfWLRteSW
	 J6mVHrGW0f4/sawhm6AAdCPN+VLHPF4Seh1dGsWwxT0A1jnA18hiEhX7A0ie3gUj35
	 8vcJgZF0RMK7ymjt5LHjE3bL0IaNtqcab3n9qzhc=
Received: from [IPv6:240e:358:1101:700:dc73:854d:832e:2] (unknown [IPv6:240e:358:1101:700:dc73:854d:832e:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 76A79659C0;
	Sun, 10 Sep 2023 12:07:52 -0400 (EDT)
Message-ID: <ed3d5214b0a84486080993b56c0de45accfe4fce.camel@xry111.site>
Subject: Re: [PATCH 2/2] LoongArch: Allow building with kcov coverage
From: Xi Ruoyao <xry111@xry111.site>
To: Guenter Roeck <linux@roeck-us.net>, Feiyang Chen
 <chenfeiyang@loongson.cn>
Cc: chenhuacai@kernel.org, dvyukov@google.com, andreyknvl@gmail.com, 
	loongarch@lists.linux.dev, kasan-dev@googlegroups.com, 
	chris.chenfeiyang@gmail.com, loongson-kernel@lists.loongnix.cn
Date: Mon, 11 Sep 2023 00:07:46 +0800
In-Reply-To: <66522279-c933-4952-9a5a-64301074a74a@roeck-us.net>
References: <cover.1688369658.git.chenfeiyang@loongson.cn>
	 <8d10b1220434432dbc089fab8df4e1cca048cd0c.1688369658.git.chenfeiyang@loongson.cn>
	 <66522279-c933-4952-9a5a-64301074a74a@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Sun, 2023-09-10 at 08:51 -0700, Guenter Roeck wrote:
> Hi,
>=20
> On Tue, Jul 04, 2023 at 08:53:32PM +0800, Feiyang Chen wrote:
> > Add ARCH_HAS_KCOV to the LoongArch Kconfig. Also disable
> > instrumentation of vdso.
> >=20
> > Signed-off-by: Feiyang Chen <chenfeiyang@loongson.cn>
>=20
> When trying to build loongarch:allmodconfig, this patch results in
>=20
> Error log:
> In file included from /opt/kernel/gcc-12.2.0-2.39-nolibc/loongarch64-linu=
x-gnu/bin/../lib/gcc/loongarch64-linux-gnu/12.2.0/plugin/include/options.h:=
8,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 from /opt/kernel/gcc-12.2.0-2.39-nolibc/loongarch6=
4-linux-gnu/bin/../lib/gcc/loongarch64-linux-gnu/12.2.0/plugin/include/tm.h=
:46,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 from /opt/kernel/gcc-12.2.0-2.39-nolibc/loongarch6=
4-linux-gnu/bin/../lib/gcc/loongarch64-linux-gnu/12.2.0/plugin/include/back=
end.h:28,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 from /opt/kernel/gcc-12.2.0-2.39-nolibc/loongarch6=
4-linux-gnu/bin/../lib/gcc/loongarch64-linux-gnu/12.2.0/plugin/include/gcc-=
plugin.h:30,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 from scripts/gcc-plugins/gcc-common.h:7,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 from scripts/gcc-plugins/latent_entropy_plugin.c:7=
8:
> /opt/kernel/gcc-12.2.0-2.39-nolibc/loongarch64-linux-gnu/bin/../lib/gcc/l=
oongarch64-linux-gnu/12.2.0/plugin/include/config/loongarch/loongarch-opts.=
h:31:10: fatal error: loongarch-def.h: No such file or directory
> =C2=A0=C2=A0 31 | #include "loongarch-def.h"

> for me. I tried with gcc 12.2 / binutils 2.39 and gcc 13.1 / binutils 2.4=
0.

> Reverting the patch or explicitly disabling CONFIG_GCC_PLUGINS fixes
> the problem.
>=20
> What compiler / binutils version combination is needed for this to work,
> or, alternatively, how would I have to configure the compiler ?

Hi Guenter,

This is a GCC bug.  It's fixed in GCC trunk and the fix has been
backported to 12/13 release branches, so GCC 14.1, 13.3, and 12.4 will
contain the fix.

The fix is available at https://gcc.gnu.org/r14-3331, you can apply the
patch building the compiler.

Sorry for the inconvenience.

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
