Received: from out-124.mta0.migadu.com (out-124.mta0.migadu.com [91.218.175.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4603033E6
	for <loongarch@lists.linux.dev>; Thu, 16 Feb 2023 20:55:34 +0000 (UTC)
Date: Thu, 16 Feb 2023 19:34:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1676576080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dpoDOnj3G+hYh7/UvLCSR56PrbvzC1VRhpcp77nLQtM=;
	b=qcBUhf3s0IDejLnw5OxOJoxCVcLGMETOrzm15p4ytyE91tA4Yrsu33AmUC9uO6e5jGR4hh
	nYMdHx9P2wq31uctirgIy23HSqhMw/nCKOVP/lO1g2NCWqNb6DnZAIHql1mhrHUabXP/Tw
	JLjP+ZKnRR0hGOwBiWkQIGTDGPxhq8Y=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Tianrui Zhao <zhaotianrui@loongson.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>, Mark Brown <broonie@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [PATCH v1 01/24] LoongArch: KVM: Implement kvm module related
 interface
Message-ID: <Y+6FTC1vBeZoZx8V@linux.dev>
References: <20230214025648.1898508-1-zhaotianrui@loongson.cn>
 <20230214025648.1898508-2-zhaotianrui@loongson.cn>
 <Y+ssT+W27GxDRAAZ@kroah.com>
 <6fd2ca5a-7243-0627-79e9-8c8bd840adc2@loongson.cn>
 <Y+tbMwXjA0hkiUJA@kroah.com>
 <a44fc722-e3e2-7f8a-0454-f27a8a10d52b@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a44fc722-e3e2-7f8a-0454-f27a8a10d52b@loongson.cn>
X-Migadu-Flow: FLOW_OUT

On Tue, Feb 14, 2023 at 09:00:50PM +0800, Tianrui Zhao wrote:
> 在 2023年02月14日 17:58, Greg Kroah-Hartman 写道:
> > On Tue, Feb 14, 2023 at 05:00:56PM +0800, Tianrui Zhao wrote:
> > > > > +#define KVM_GET_CSRS		_IOWR(KVMIO, 0xc5, struct kvm_csrs)
> > > > > +#define KVM_SET_CSRS		_IOW(KVMIO,  0xc6, struct kvm_csrs)
> > > > Why does this arch need new ioctls?
> > > We want to use this ioctl to access multiple csrs at one time. If without
> > > this, we only access one csr.
> > What is wrong with accessing only one csr at a time?  Isn't this what
> > other architectures do?
> 
> Generally, using KVM_GET_ONE_GET ioctl to get one reg, but we want a
> more convenient interface to get serial regs at one time, so we add this
> ioctl.

Have you found register accesses through the KVM_{GET,SET}_ONE_REG
ioctls to actually be a bounding issue? I'd be surprised if that were
actually the case.

An architecture-neutral implementation was entertained a few years ago
[*], but even then it saved an inconsequential amount of time relative
to the rest of VM serialization (at least for arm64). The one thing that
series got right was to share the plumbing across all architectures that
use the ONE_REG interface (i.e. everyone but x86).

If you have data that supports the thesis that a batched ioctl is
useful then please do share. But in any case this should not use an ioctl
tied down to a single architecture.

[*] https://lore.kernel.org/kvm/20201120125616.14436-1-darkhan@amazon.com/

-- 
Thanks,
Oliver
