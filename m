Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7B610E9
	for <loongarch@lists.linux.dev>; Tue, 21 Mar 2023 12:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1679401840;
	bh=RIk1bW9UJ1N6hwpsv3iiYyeLz4E5i4Xo2Z7MHEEpqjw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=UrurL81bAtGJJ3vZF1m5JCqI4EOjAq6EMSwanOFS3UJhoPWGXuutALltE8o6kYvFf
	 KwIZslmJw9bw6RTmF+BlYodHgJPXwEd/QnWwXEeW33vnD7oE3xdEri+bAtmbZLWbcq
	 wvc+BcyytHLH0o7Y5nGdQySA2P/RCTJsMd3qMBLc=
Received: from localhost.localdomain (xry111.site [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id F2CD46633A;
	Tue, 21 Mar 2023 08:30:37 -0400 (EDT)
Message-ID: <75f843b2780fc3c3dcc1d0d8f78f2b955956316b.camel@xry111.site>
Subject: Re: [PATCH v4 05/29] LoongArch: KVM: Add vcpu related header files
From: Xi Ruoyao <xry111@xry111.site>
To: Tianrui Zhao <zhaotianrui@loongson.cn>, Paolo Bonzini
 <pbonzini@redhat.com>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org,  kvm@vger.kernel.org, Jens Axboe
 <axboe@kernel.dk>, Mark Brown <broonie@kernel.org>,  Alex Deucher
 <alexander.deucher@amd.com>, Oliver Upton <oliver.upton@linux.dev>,
 maobibo@loongson.cn
Date: Tue, 21 Mar 2023 20:30:36 +0800
In-Reply-To: <20230321035651.598505-6-zhaotianrui@loongson.cn>
References: <20230321035651.598505-1-zhaotianrui@loongson.cn>
	 <20230321035651.598505-6-zhaotianrui@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2023-03-21 at 11:56 +0800, Tianrui Zhao wrote:
> +/* Tracepoints for VM exits */
> +#define kvm_trace_symbol_exit_types=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0\
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0({ KVM_TRACE_EXIT_IDLE,=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"IDLE" },=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0\
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ KVM_TRACE_EXIT_CACHE,=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"CACHE" },=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0\
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ KVM_TRACE_EXIT_SIGNAL,=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"Signal" })

Looks like there shouldn't be "(" and ")".

> +#define kvm_trace_symbol_aux_op				\
> +	({ KVM_TRACE_AUX_RESTORE,	"restore" },	\
> +	{ KVM_TRACE_AUX_SAVE,		"save" },	\
> +	{ KVM_TRACE_AUX_ENABLE,		"enable" },	\
> +	{ KVM_TRACE_AUX_DISABLE,	"disable" },	\
> +	{ KVM_TRACE_AUX_DISCARD,	"discard" })

Likewise.

See the test robot report, and https://godbolt.org/z/bE8q97z1o.

The lesson: if a text book claims "you should always wrap the content of
a macro in ( ... )", we should burn it in the fire! :)

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
