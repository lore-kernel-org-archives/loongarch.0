Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EDC7B
	for <loongarch@lists.linux.dev>; Wed, 15 Feb 2023 08:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1676448446;
	bh=Ler2UBqqdij4bGpnF6QN771+SrKMZqCdjzRIMw2xagw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=A6KDhiiqd0L4VJRzg4GArfH3j0ztxAeP17Rn0tonxfU4DLnsGzXKceHRSkMFDKZOp
	 YOyFXkMmDEY0aeWHrPsQEiLzBAXz3Z6C1ghVmhE5o2IqkxgIjeFfiq3h9sVBKKbhUn
	 hFXQhRkNhBzzF4jBh/cfHcCUCBTMglx8lRDYZp9o=
Received: from [IPv6:240e:456:1020:352:6860:35c9:52f4:b84b] (unknown [IPv6:240e:456:1020:352:6860:35c9:52f4:b84b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 2E00B65F1A;
	Wed, 15 Feb 2023 03:07:21 -0500 (EST)
Message-ID: <818419c03037bda833a5b281588a4b331c34ae8c.camel@xry111.site>
Subject: Re: "kernel ade access" oops on LoongArch
From: Xi Ruoyao <xry111@xry111.site>
To: Jinyang He <hejinyang@loongson.cn>, Youling Tang
 <tangyouling@loongson.cn>
Cc: loongarch@lists.linux.dev, Huacai Chen <chenhuacai@kernel.org>, WANG
 Xuerui <kernel@xen0n.name>, linux-kernel@vger.kernel.org
Date: Wed, 15 Feb 2023 16:07:15 +0800
In-Reply-To: <5403e5eb-5792-7d6f-df74-ca3fab82ecd5@loongson.cn>
References: <1e6f4d35946e4e2e7c7f5dcc7b69d5e609de8184.camel@xry111.site>
	 <2e902dfa-cb84-7ef0-6b50-02b16354a139@loongson.cn>
	 <511d385675ea7a846ff791974c6ae7feeeec2589.camel@xry111.site>
	 <9a70e89c-0f3b-0660-501e-3292e410cfd8@loongson.cn>
	 <5403e5eb-5792-7d6f-df74-ca3fab82ecd5@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2023-02-15 at 15:51 +0800, Jinyang He wrote:

> > There was a build error in make check, so only tst-mallocfork3-
> > malloc-check was tested separately.
> >=20
> > # make test t=3Dmalloc/tst-mallocfork3-malloc-check
> > make[2]: =E7=A6=BB=E5=BC=80=E7=9B=AE=E5=BD=95=E2=80=9C/home/loongson/gl=
ibc/malloc=E2=80=9D
> > PASS: malloc/tst-mallocfork3-malloc-check
> > original exit status 0
> > info: signals received during fork: 301
> > info: signals received during free: 1693
> > info: signals received during malloc: 119
> > make[1]: =E7=A6=BB=E5=BC=80=E7=9B=AE=E5=BD=95=E2=80=9C/home/loongson/gl=
ibc=E2=80=9D
> >=20
> > A total of five tests are PASS, and the serial port does not display
> > CallTrace.
> >=20
> > Youling.
> >=20
> I had test it by using the cmd "while true..." Ruoyao gave on
>=20
> Loongson-3A5000, CLFS 7.1, 6.2-rc8 kernel with those patches and
>=20
> 6.2-rc7 kernel form loongson-next. No calltrace displayed, either.

Hmm... I've read the code for a while and I couldn't see how it could
end up accessing a bad address too.  Maybe my hardware or compiler is
really faulty?


--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
