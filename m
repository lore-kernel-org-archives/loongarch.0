Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB1E2902
	for <loongarch@lists.linux.dev>; Thu, 22 Sep 2022 10:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1663840814;
	bh=HzJofWRv3m8EQ51sdL5NafzdnVZUtZE+l9m+ZAeGom4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Z5nEy/vKt8gAgz6JoBehtSar2k4glFXZCou7F9WcsbGr9CeFepDFvW3C/O5u/1yn8
	 PCUW7dvuMi17HHEdZJI+NDZGdCr7O1V5aPNt7TrZSHQ40AWKhk1zrexT1roBGU5k0/
	 ysTbrt2RdgrPrs9a5lfjwnXAzvX2QzMH7um8osc0=
Received: from localhost.localdomain (xry111.site [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id DB81265EB4;
	Thu, 22 Sep 2022 06:00:11 -0400 (EDT)
Message-ID: <bfe4fed8b1da17561214cf9f2cf5acdf0e74d0ea.camel@xry111.site>
Subject: Re: [PATCH v3 1/3] LoongArch: Add kexec support
From: Xi Ruoyao <xry111@xry111.site>
To: Youling Tang <tangyouling@loongson.cn>, Huacai Chen
 <chenhuacai@kernel.org>,  Baoquan He <bhe@redhat.com>, Eric Biederman
 <ebiederm@xmission.com>
Cc: WANG Xuerui <kernel@xen0n.name>, Vivek Goyal <vgoyal@redhat.com>, Dave
 Young <dyoung@redhat.com>, Guo Ren <guoren@kernel.org>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>,  kexec@lists.infradead.org,
 loongarch@lists.linux.dev,  linux-kernel@vger.kernel.org
Date: Thu, 22 Sep 2022 18:00:09 +0800
In-Reply-To: <1663210426-15446-2-git-send-email-tangyouling@loongson.cn>
References: <1663210426-15446-1-git-send-email-tangyouling@loongson.cn>
	 <1663210426-15446-2-git-send-email-tangyouling@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.0 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Thu, 2022-09-15 at 10:53 +0800, Youling Tang wrote:
> +int machine_kexec_prepare(struct kimage *kimage)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int i;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0void *dtb =3D (void *)KEXEC_BL=
OB_ADDR;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0kexec_image_info(kimage);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Find the Flattened Device T=
ree */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0for (i =3D 0; i < kimage->nr_s=
egments; i++) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0if (!fdt_check_header(kimage->segment[i].buf)) {

Hi Youling,

When I build Huacai's tree
(https://github.com/loongson/linux/commits/loongarch-next), there is a
strange error linking vmlinux:

ld: arch/loongarch/kernel/machine_kexec.o: in function `machine_kexec_prepa=
re':
/home/xry111/git-repos/linux/arch/loongarch/kernel/machine_kexec.c:70: unde=
fined reference to `fdt_check_header'

Not sure why...

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
