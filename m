Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D291A12B77
	for <loongarch@lists.linux.dev>; Tue, 13 Jun 2023 12:57:37 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2b3402f6befso2797261fa.2
        for <loongarch@lists.linux.dev>; Tue, 13 Jun 2023 05:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686661056; x=1689253056;
        h=content-transfer-encoding:in-reply-to:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XeFbrqjcv72tXKY+nTQZPqYsLbKLXvzDbqnXIJWbTaI=;
        b=F8VnRb8baWHgKP7PGJySntfa4HuH266ABbFf9nId1exOyhM/HnnQ/GywEd0BxhfGHu
         X+luqaQSHaFKkz1nXryWggrcRnyk+KUEytNhbL6ujbuN6Wi7hS+9PUmXykJz6BUUNSMc
         9BAKSdiAzBDZVwqMvhzHJRovQ6NmXSRibBDtOnER+gnqh03i+9/ivgzNOWlvXlGhGpBG
         POOMoB+I3FweB+xZvaCgAUWBaL76Z6t98IcdTiKOmvBtAVNxBi2xprk/qzjXw4anLsmO
         Hd1h4rEz9BCi8Iqch0RFz8FQAnX6d46OFwT02Bwt50ZCv+YtKZDH8qrEpSRWEbxReAoa
         INzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686661056; x=1689253056;
        h=content-transfer-encoding:in-reply-to:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XeFbrqjcv72tXKY+nTQZPqYsLbKLXvzDbqnXIJWbTaI=;
        b=Teo1+NvWnl+O3fCjw6jznAARfn8XIBEEVxU0++4m/Sgj1I4z1SWTKnEF7srqaNEEeh
         GXh7qrJesbkymW7GA+/6yFkSOPmla0fn2H+dtodPpzh0ymFlPLy82hzcMNhMmlLw9PNn
         uAplMhk/9D71d1YgIXCZ4uAmQ2iE2hHe7MApKsZMs2Eg80w0AukwaxYbhAn8yIzrXGqI
         k5S8Jav1WlOZeGAqIeSo459CX4Le0DI+o83yFuSbcv0daRrpUNuFQnm6XOihk3aCcQV1
         HrUeTXp5chLTxSd1wETpFhXFfl3GJLVcTQoawy5MzHcl8XhUXxUFoE5XjylQ3OooTYsU
         Ox5g==
X-Gm-Message-State: AC+VfDz+LRJh6kZIAGuBWhKPF1vpbxqO519AdnhvGFoM0Hgmid8/v4qg
	tA6pxWtWw4DtfQG9HUy/m0c=
X-Google-Smtp-Source: ACHHUZ58fdvqqZGzZ2BJ69HvjsawvXZXVqX8mWvk/TZrT9Ybw87KzskU5alAos2BM+DSCl/BlFmKEw==
X-Received: by 2002:a2e:241a:0:b0:2b1:e958:efa0 with SMTP id k26-20020a2e241a000000b002b1e958efa0mr3743952ljk.50.1686661055572;
        Tue, 13 Jun 2023 05:57:35 -0700 (PDT)
Received: from ?IPV6:2a0b:6204:4302:5f00:4dab:3483:4506:9a0e? ([2a0b:6204:4302:5f00:4dab:3483:4506:9a0e])
        by smtp.gmail.com with ESMTPSA id r7-20020a2eb607000000b0029c96178425sm2165663ljn.19.2023.06.13.05.57.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 05:57:35 -0700 (PDT)
From: "bibo, mao" <bibo.mao@gmail.com>
X-Google-Original-From: "bibo, mao" <maobibo@loongson.cn>
Message-ID: <5442b28a-12d9-bacb-3983-ad4cc0c79689@loongson.cn>
Date: Tue, 13 Jun 2023 20:57:30 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v13 10/30] LoongArch: KVM: Implement vcpu ENABLE_CAP ioctl
 interface
To: Tianrui Zhao <zhaotianrui@loongson.cn>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, loongarch@lists.linux.dev,
 Jens Axboe <axboe@kernel.dk>, Mark Brown <broonie@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Oliver Upton <oliver.upton@linux.dev>, Xi Ruoyao <xry111@xry111.site>,
 tangyouling@loongson.cn, linux-kernel@vger.kernel.org, kvm@vger.kernel.org
References: <20230609090832.2131037-1-zhaotianrui@loongson.cn>
 <20230609090832.2131037-11-zhaotianrui@loongson.cn>
In-Reply-To: <20230609090832.2131037-11-zhaotianrui@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Reviewed-by: Bibo Mao <maobibo@loongson.cn>

Regards
Bibo, Mao

在 2023/6/9 17:08, Tianrui Zhao 写道:
> Implement LoongArch vcpu KVM_ENABLE_CAP ioctl interface.
> 
> Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
> ---
>   arch/loongarch/kvm/vcpu.c | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
> index b0cce413762d..da97b77da8eb 100644
> --- a/arch/loongarch/kvm/vcpu.c
> +++ b/arch/loongarch/kvm/vcpu.c
> @@ -186,6 +186,16 @@ int kvm_arch_vcpu_ioctl_set_regs(struct kvm_vcpu *vcpu, struct kvm_regs *regs)
>   	return 0;
>   }
>   
> +static int kvm_vcpu_ioctl_enable_cap(struct kvm_vcpu *vcpu,
> +				     struct kvm_enable_cap *cap)
> +{
> +	/*
> +	 * FPU is enable by default, do not support any other caps,
> +	 * and later we will support such as LSX cap.
> +	 */
> +	return -EINVAL;
> +}
> +
>   long kvm_arch_vcpu_ioctl(struct file *filp,
>   			 unsigned int ioctl, unsigned long arg)
>   {
> @@ -209,6 +219,15 @@ long kvm_arch_vcpu_ioctl(struct file *filp,
>   			r = _kvm_get_reg(vcpu, &reg);
>   		break;
>   	}
> +	case KVM_ENABLE_CAP: {
> +		struct kvm_enable_cap cap;
> +
> +		r = -EFAULT;
> +		if (copy_from_user(&cap, argp, sizeof(cap)))
> +			break;
> +		r = kvm_vcpu_ioctl_enable_cap(vcpu, &cap);
> +		break;
> +	}
>   	default:
>   		r = -ENOIOCTLCMD;
>   		break;
