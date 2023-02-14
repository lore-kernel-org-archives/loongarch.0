Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770087C
	for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 09:58:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C3C5C433D2;
	Tue, 14 Feb 2023 09:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1676368699;
	bh=OU9XaxlzIQNm9uPoSElC+25TvF2PsT501YwBQ7EdhCU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZNIpNVUu5NKWJ2OPxfSC7tnHbL6lgxuXuwdPCP5gl5gWBFxbVTdAACSmagfVWjewx
	 O7m9GYOYk/+lrirlWzbu6Ro/o43n/tVE1Nr/c185YifxFrNyumd3rUbfeCrMmojOTM
	 JfuOyFlOb1riQJV7vPBx4NDF2QOuzQiaAGqXjHtc=
Date: Tue, 14 Feb 2023 10:58:11 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Tianrui Zhao <zhaotianrui@loongson.cn>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>, Mark Brown <broonie@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [PATCH v1 01/24] LoongArch: KVM: Implement kvm module related
 interface
Message-ID: <Y+tbMwXjA0hkiUJA@kroah.com>
References: <20230214025648.1898508-1-zhaotianrui@loongson.cn>
 <20230214025648.1898508-2-zhaotianrui@loongson.cn>
 <Y+ssT+W27GxDRAAZ@kroah.com>
 <6fd2ca5a-7243-0627-79e9-8c8bd840adc2@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6fd2ca5a-7243-0627-79e9-8c8bd840adc2@loongson.cn>

On Tue, Feb 14, 2023 at 05:00:56PM +0800, Tianrui Zhao wrote:
> > > +#define KVM_GET_CSRS		_IOWR(KVMIO, 0xc5, struct kvm_csrs)
> > > +#define KVM_SET_CSRS		_IOW(KVMIO,  0xc6, struct kvm_csrs)
> > Why does this arch need new ioctls?
> We want to use this ioctl to access multiple csrs at one time. If without
> this, we only access one csr.

What is wrong with accessing only one csr at a time?  Isn't this what
other architectures do?

> There is another function, can we use the KVM_GET/SET_MSRS to access our
> csrs?

I do not know, that's up to the KVM developers to answer.

thanks,

greg k-h
