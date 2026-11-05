Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793865152;
	b=Dmb/yIELFP3wXzkOHQCVhrgJgf2WZ9YUiXJedWIOzK8YX+1i6yAMWuwrAGVP+PQKNQl4
	 aVBrs4oSLr/y07/OxoMNbWOBL/clkF+RLjelRK1lw9zRLg5700QEbuvmm4rTA+BzDQV4F
	 RcPOwB54MC32SSM2p8jmUE12HT+ZGydAPhosTDyJ/4kALU3x+UwJjte0lTgaSm3tzyV5X
	 G0fKNH8FIjk//UGDMiV0LFcCu/wSw8YYzffXNxJSCHcPhDKEpqvPdd9ftmu82qn/19zys
	 5TqCzU8ZXn69vvgR6Lxt8sk8LgtyG081Cr7vhY6sY8pPF0lr48ksqqBY/vixpxV+f6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793865152;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=PshXrkjIu/oVh8H0uuMMexWF+3wbEqyJSvZGNZ3+nBg=;
	b=DcUNEUvn7sup5rDap7EzDq/B2B6mhM49IAn7Fhg0JJ4MKgDnpfsFfTEZbyFMucYUZbLu
	 32Ohysy9iWcJD0EUUbS11yNsBRjXpk6xab2n2QOko++kzz8u8GdL1a9BEl+77tyqF6Xcz
	 ghtWJbffoGvF2twNIJjYYMNmwNV86iNoEgwh8ZFoXRdRUSkm3vS3Q4HGTjkUdvaOCRM2o
	 zy7Qk2yVhPH1Nq2CywprCu+sPwVYrncaKY4cW10FzNX2H/YCJxZY54jwEqI6vT3xQAvN0
	 xorlS4/sckr8igRaw8pz/RZ8uLzvsdEppXQt0KziFSdBo91CXZamX/rAwsB1YX82Uxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ewqv2x7q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC24B606A32E;
	Thu,  5 Nov 2026 07:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ewqv2x7q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90ABD1F00A15;
	Thu,  5 Nov 2026 07:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793865151;
	bh=PshXrkjIu/oVh8H0uuMMexWF+3wbEqyJSvZGNZ3+nBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ewqv2x7qC/seZGztnmn60Jxwl1553DY/3Df5K32EVdXJ/LFXDDt8XPm0md4mvIdbe
	 O7baTlLtl+fjfHYpiP6NcAphW25/jd9J02KuH6IpVpOf128w6Gk/QhyuyYiZ8AkWEd
	 5I8acWTijjPru9qgJ7HQjHMGzi6ZlJdrE9q8FPGTREZLPcuF2t9RZCaCb3gZIq0i2F
	 0CenpiJNcoERzlwxTs0A3D2xG24ySM7ZrAY0uQR/yg7LLM7PxiAALyYLO9ZiDNOVS8
	 XhlU+5NQ65DYU30sIL8WOqi4fmSQc0g+DhJNmCoP27d9xfq6w4CfLjfd7xU/0Ji7zb
	 e/wsPKB9qBz9g==
Date: Thu, 5 Nov 2026 09:52:10 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
	chenhuacai@kernel.org, kernel@xen0n.name, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org,
	ritesh.list@gmail.com, sshegde@linux.ibm.com, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, hpa@zytor.com,
	akpm@linux-foundation.org, baoquan.he@linux.dev,
	pasha.tatashin@soleen.com, pratyush@kernel.org, thuth@redhat.com,
	leitao@debian.org, yeoreum.yun@arm.com, robh@kernel.org,
	sourabhjain@linux.ibm.com, kees@kernel.org, coiby.xu@gmail.com,
	Yeking@red54.com, tangyouling@kylinos.cn, maqianga@uniontech.com,
	zhangtianyang@loongson.cn, guodongtai@kylinos.cn, blum@kernel.org,
	adityag@linux.ibm.com, hui.wang@canonical.com,
	sohammetha01@gmail.com, guoren@kernel.org, gaohan@iscas.ac.cn,
	kai.huang@intel.com, kas@kernel.org, vishal.l.verma@intel.com,
	piliu@redhat.com, jbouron@amazon.com, mclapinski@google.com,
	me@linux.beauty, graf@amazon.com, bgwin@google.com, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, kexec@lists.infradead.org
Subject: Re: [PATCH v7 00/15] kexec: Fix CMA and elf header leaks and rework
Message-ID: <auw1qgmjWko52oS_@kernel.org>
References: <20261026075201.699550-1-ruanjinjie@huawei.com>
 <179380419709.28814.2122135856184991710.b4-review@b4>
 <932cdfda-7030-4829-8b43-062d208450e4@huawei.com>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <932cdfda-7030-4829-8b43-062d208450e4@huawei.com>

On Thu, Nov 05, 2026 at 11:45:39AM +0800, Jinjie Ruan wrote:
> 在 2026/11/4 22:56, Mike Rapoport 写道:
>
> >> Patches 8-10 pass the kbuf fields to crash_prepare_headers() to
> >> simplfy code.
> >>
> >> Patch 11 frees the elf core header from the generic post-load cleanup.
> >>
> >> Patches 12-15 add kexec_load_other_segments() and convert the three
> >> architectures, and arch_kexec_setup_other_segments() builds
> >> the architecture specific boot parameters (a DTB or a command line).
> > 
> > I think the refactoring should go before the identical fixes in arch/
> > code.
> 
> However, this will cause trouble for the fix patch in the stable round.

That's right, but since actual fixes anyway require changes to kexec core,
I think it's better to refactor first. The core than will take care of
proper freeing in the most cases.

And since CMA support in kexec is quite new I think the entire set can be
backported to stable then.

I'm planning to have a closer look at the refactoring Really Soon :) 

> -- 
> Best regards,
> Jinjie
> 

-- 
Sincerely yours,
Mike.
