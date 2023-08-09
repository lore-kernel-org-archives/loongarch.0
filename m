Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDDB11C98
	for <loongarch@lists.linux.dev>; Wed,  9 Aug 2023 11:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1691582337;
	bh=swOtItoGXcio+rkfCJirv3aPyWeCVIZY3EQMvLjH/08=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=KZyjv/NYdyOILFPhqqmcuZeTpQfn+QjhnJtpxkjS+pEYj0IpLVgOOtukYWosIrf8w
	 2V5U8VzLszMWqYg5/6gdujsHbA1MMnCZyETTndlFumc9J0f2k+NAi7cMQtMFWiTYa9
	 3mIuybI6KVqlvxNs3W0EEEIXsFDzzLCtXXraZXBk=
Received: from [IPv6:2409:8a0c:2a4:2170:40dc:a500:81f0:2] (unknown [IPv6:2409:8a0c:2a4:2170:40dc:a500:81f0:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 9E02D659AD;
	Wed,  9 Aug 2023 07:58:53 -0400 (EDT)
Message-ID: <0d491d44407051993e5b68b6f9ef67d4060db6c4.camel@xry111.site>
Subject: Re: [PATCH v1 5/6] objtool: Add skipped member in struct reloc
From: Xi Ruoyao <xry111@xry111.site>
To: Peter Zijlstra <peterz@infradead.org>, Tiezhu Yang
 <yangtiezhu@loongson.cn>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Huacai Chen
 <chenhuacai@kernel.org>,  loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org,  loongson-kernel@lists.loongnix.cn
Date: Wed, 09 Aug 2023 19:58:20 +0800
In-Reply-To: <b6b596a1311d9a26e19ee831a2f8161c175c4ad6.camel@xry111.site>
References: <1690272910-11869-1-git-send-email-yangtiezhu@loongson.cn>
	 <1690272910-11869-6-git-send-email-yangtiezhu@loongson.cn>
	 <20230725115959.GE3765278@hirez.programming.kicks-ass.net>
	 <b111cb87-3f30-860a-640b-2f7264a16838@loongson.cn>
	 <20230803121103.GE214207@hirez.programming.kicks-ass.net>
	 <b6b596a1311d9a26e19ee831a2f8161c175c4ad6.camel@xry111.site>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2023-08-09 at 19:51 +0800, Xi Ruoyao wrote:
> On Thu, 2023-08-03 at 14:11 +0200, Peter Zijlstra wrote:
> > On Thu, Aug 03, 2023 at 07:36:24PM +0800, Tiezhu Yang wrote:
> >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0".long " __stringify_label(c) "b - .\n\t"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 \
> >=20
> > > I discussed offline with the engineers who are familiar with gnu
> > > assembler of LoongArch, maybe it can modify the gnu assembler
> > > to use R_LARCH_32_PCREL to replace a pair of R_LARCH_ADD32 and
> > > R_LARCH_SUB32, then I will test it again and drop this change if
> > > possible.
>=20
> Hmm, but I don't like the idea to disallow users having GAS <=3D 2.41 fro=
m
> using ORC unwinder.
>=20
> Can we emit the R_LARCH_32_PCREL reloc with an explicit .reloc
> directive?

Answering myself: "maybe", I've written a simple PoC:

$ cat t.s
.global main
main:
  la.pcrel $t0, f
  ld.w     $t1, $t0, 0
  ldx.d    $a0, $t1, $t0
  jr       $ra

t:
  .dword   42
  .zero    64

f:
  .reloc   f, R_LARCH_32_PCREL, t
  .word    0
$ ./a.out
$ echo $?
42
--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
