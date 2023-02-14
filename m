Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FB515A8
	for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 06:38:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90736C433D2;
	Tue, 14 Feb 2023 06:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1676356691;
	bh=k2hApELG0n0PIUC6rX/dhhz1ONPNcDWoNIMjZyxg/eE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a9e3Nx/UjLOgeGIbQwDbavWoqkr58W10P+9C+FTL6OFhYF+DK6rknTvWVicTo1qLa
	 0MV1L4nd3RqjUb6egrVUeopyPa040MLp3Ps5Cxna58LB52gcxbsvBXHpy7FY6cJ5GW
	 SuZkFbOqlLGgw/hYPunPgCJ5y89zdECkN4iaOWhE=
Date: Tue, 14 Feb 2023 07:38:07 +0100
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
Message-ID: <Y+ssT+W27GxDRAAZ@kroah.com>
References: <20230214025648.1898508-1-zhaotianrui@loongson.cn>
 <20230214025648.1898508-2-zhaotianrui@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230214025648.1898508-2-zhaotianrui@loongson.cn>

On Tue, Feb 14, 2023 at 10:56:25AM +0800, Tianrui Zhao wrote:
> 1. Implement loongarch kvm module init, module exit interface,
> using kvm context to save the vpid info and vcpu world switch
> interface pointer.
> 2. Implement kvm hardware enable, disable interface, setting
> the guest config reg to enable virtualization features.
> 3. Add kvm related headers.

Shouldn't this be 3 different patches instead?

> 
> Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
> ---
>  arch/loongarch/include/asm/cpu-features.h |  22 ++
>  arch/loongarch/include/asm/kvm_host.h     | 257 ++++++++++++++++++++++
>  arch/loongarch/include/asm/kvm_types.h    |  11 +
>  arch/loongarch/include/uapi/asm/kvm.h     | 121 ++++++++++
>  arch/loongarch/kvm/main.c                 | 152 +++++++++++++
>  include/uapi/linux/kvm.h                  |  15 ++
>  6 files changed, 578 insertions(+)
>  create mode 100644 arch/loongarch/include/asm/kvm_host.h
>  create mode 100644 arch/loongarch/include/asm/kvm_types.h
>  create mode 100644 arch/loongarch/include/uapi/asm/kvm.h
>  create mode 100644 arch/loongarch/kvm/main.c
> 
> diff --git a/arch/loongarch/include/asm/cpu-features.h b/arch/loongarch/include/asm/cpu-features.h
> index b07974218..23e7c3ae5 100644
> --- a/arch/loongarch/include/asm/cpu-features.h
> +++ b/arch/loongarch/include/asm/cpu-features.h
> @@ -64,5 +64,27 @@
>  #define cpu_has_guestid		cpu_opt(LOONGARCH_CPU_GUESTID)
>  #define cpu_has_hypervisor	cpu_opt(LOONGARCH_CPU_HYPERVISOR)
>  
> +#define cpu_has_matc_guest	(cpu_data[0].guest_cfg & (1 << 0))
> +#define cpu_has_matc_root	(cpu_data[0].guest_cfg & (1 << 1))
> +#define cpu_has_matc_nest	(cpu_data[0].guest_cfg & (1 << 2))
> +#define cpu_has_sitp		(cpu_data[0].guest_cfg & (1 << 6))
> +#define cpu_has_titp		(cpu_data[0].guest_cfg & (1 << 8))
> +#define cpu_has_toep		(cpu_data[0].guest_cfg & (1 << 10))
> +#define cpu_has_topp		(cpu_data[0].guest_cfg & (1 << 12))
> +#define cpu_has_torup		(cpu_data[0].guest_cfg & (1 << 14))
> +#define cpu_has_gcip_all	(cpu_data[0].guest_cfg & (1 << 16))
> +#define cpu_has_gcip_hit	(cpu_data[0].guest_cfg & (1 << 17))
> +#define cpu_has_gcip_secure	(cpu_data[0].guest_cfg & (1 << 18))

Why not use BIT() for all of those "<<" statements?

> +#define KVM_GET_CSRS		_IOWR(KVMIO, 0xc5, struct kvm_csrs)
> +#define KVM_SET_CSRS		_IOW(KVMIO,  0xc6, struct kvm_csrs)

Why does this arch need new ioctls?

thanks,

greg k-h
