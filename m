Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3193C02
	for <loongarch@lists.linux.dev>; Mon,  6 Mar 2023 12:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1678104567;
	bh=Sjwa9ifIBvxLH+dQt5f1i4tLOr8oSfIbilkx/Lz3tZU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=JgvhxuBXzmO/JFFrY6NaobpfeAEx2fKF6uTzyu7RhIz94OhM8uNx8f7WhjhkJJDn6
	 egE2ld5rSmB9X0As4d48F3zNMYh6BjJC4biQoVVYZ6aBYjWTqPa3TpzWPM0Jf29Kgr
	 YAuAN5NqVPNJF0hqywWdbqHOopwTxbF+wIyR66xA=
Received: from [IPv6:240e:456:1020:bd2:48ae:29ab:cdd8:861c] (unknown [IPv6:240e:456:1020:bd2:48ae:29ab:cdd8:861c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 1DB7366304;
	Mon,  6 Mar 2023 07:09:18 -0500 (EST)
Message-ID: <95273478173af301f3b63b9be2559213e4f29fb8.camel@xry111.site>
Subject: Re: [PATCH V3] LoongArch: Provide kernel fpu functions
From: Xi Ruoyao <xry111@xry111.site>
To: maobibo <maobibo@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Arnd Bergmann
	 <arnd@arndb.de>, Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, linux-arch@vger.kernel.org, Xuefeng Li
	 <lixuefeng@loongson.cn>, Guo Ren <guoren@kernel.org>, Xuerui Wang
	 <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
Date: Mon, 06 Mar 2023 20:09:07 +0800
In-Reply-To: <029a5993-b993-ab73-0a14-0df9b0ddf3da@loongson.cn>
References: <20230306095934.609589-1-chenhuacai@loongson.cn>
	 <029a5993-b993-ab73-0a14-0df9b0ddf3da@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Mon, 2023-03-06 at 20:03 +0800, maobibo wrote:
> =E5=9C=A8 2023/3/6 17:59, Huacai Chen =E5=86=99=E9=81=93:
> > Provide kernel_fpu_begin()/kernel_fpu_end() to allow the kernel itself
> > to use fpu. They can be used by some other kernel components, e.g., the
> > AMDGPU graphic driver for DCN.
> Since kernel is compiled with -msoft-float, I guess hw fpu will not be
> used in kernel by present:). However it is deserved to try.

See the draft AMD DCN support patch:
https://github.com/loongson/linux/commit/0ee299095c963938a7626c3121a8feef32=
251301

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
