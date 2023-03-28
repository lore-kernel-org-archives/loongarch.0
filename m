Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97A18465
	for <loongarch@lists.linux.dev>; Tue, 28 Mar 2023 14:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680012840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ffLH5bZRJ6YtgLRSBMwzxg/+hZRSIpwmfi4hS4N8Nuc=;
	b=eHw3l14bA7G0/Dq7DHE/y5X/WaB/JnOfrFfcJD26YhXBfioFjQ9qsvlj7N86XpvqEsObFS
	XNKheb2y8iYtwhjnuaQ2xKZIbPQPU5PnnutghhPChRJ/N7wds493yDxRJLHVUD5HiOFq6P
	Nx/ZHttcBuqmAh1qBO55x3egPRDe/4Y=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-FoRkc10XN3q8LatJVaj0Bg-1; Tue, 28 Mar 2023 10:13:57 -0400
X-MC-Unique: FoRkc10XN3q8LatJVaj0Bg-1
Received: by mail-ed1-f70.google.com with SMTP id ev6-20020a056402540600b004bc2358ac04so17939108edb.21
        for <loongarch@lists.linux.dev>; Tue, 28 Mar 2023 07:13:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680012836;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ffLH5bZRJ6YtgLRSBMwzxg/+hZRSIpwmfi4hS4N8Nuc=;
        b=JMvFGruQ0xwrvg/KczhYGJO8j+utkaHY6mjPXxaMjpyn++86XsQi3kDRX+uZwTPnXC
         1aAz1xZEb3KPbKB2ClhZI4P5zbvmgXAmgjWHffUAaePdQGtcN4Ni32TGdupiQy5BMNYB
         2ElHIDxOdIWg+MIWlbGXmi077FLV3GCHjw/uH3DPTkvqJEb2pPkIBjcWrY2lvSoRqNO/
         1IWKSaJYLpyifOwZh5qsoDt0jsz8tM551LonuG4R99qPoDPrE8rkPpVWET+VtuOISZ8V
         R/b53b4CejUL5Waxi3A7QXZy6q8WaPd+CNxAgAAw3dzLEBm7m68CPz4Sxat8UeLOJiaX
         WXbw==
X-Gm-Message-State: AAQBX9dLUNdU7qj/0YHuZxLpya9jg3ePmMZQF6aXFKZFMLsjVp9lp7jA
	M7ktP4kSofg/eNzgZzPZShv5coOFIhlChdWy3uwUkPGeM0IMz4cU80l8hl68t8MrznVbiGkauTL
	ARmuddwft4L+HaKkzSfWl
X-Received: by 2002:a17:906:4c91:b0:946:be05:ed7a with SMTP id q17-20020a1709064c9100b00946be05ed7amr2887644eju.70.1680012835985;
        Tue, 28 Mar 2023 07:13:55 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZDesR/WhBhPl2B8jond6w5UYfHY//O0l7vDZqE7Ay9Y8tX64ayaBkW6XL6HcuBZ2hIUUWFwA==
X-Received: by 2002:a17:906:4c91:b0:946:be05:ed7a with SMTP id q17-20020a1709064c9100b00946be05ed7amr2887614eju.70.1680012835739;
        Tue, 28 Mar 2023 07:13:55 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c? ([2001:b07:6468:f312:1c09:f536:3de6:228c])
        by smtp.googlemail.com with ESMTPSA id gv27-20020a1709072bdb00b008b9b4ab6ad1sm15335005ejc.102.2023.03.28.07.13.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 07:13:55 -0700 (PDT)
Message-ID: <7463da3b-1d52-40a4-97a3-4f912f4f9fdb@redhat.com>
Date: Tue, 28 Mar 2023 16:13:54 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
To: Tianrui Zhao <zhaotianrui@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Mark Brown <broonie@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Oliver Upton <oliver.upton@linux.dev>, maobibo@loongson.cn,
 Xi Ruoyao <xry111@xry111.site>
References: <20230328123119.3649361-1-zhaotianrui@loongson.cn>
 <20230328123119.3649361-24-zhaotianrui@loongson.cn>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PING PATCH v4 23/29] LoongArch: KVM: Implement handle gspr
 exception
In-Reply-To: <20230328123119.3649361-24-zhaotianrui@loongson.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/28/23 14:31, Tianrui Zhao wrote:
> +			case 0xc91:
> +				/* idle GSPR */
> +				er = _kvm_emu_idle(vcpu);
> +				break;

So this is my last remark.  What some other architectures do is change 
vcpu->arch.mp_state when entering an idle state, and at this point all 
calls to KVM_RUN would call the equivalent of _kvm_emu_idle().  This 
requires implementing the KVM_GET_MPSTATE and KVM_SET_MPSTATE ioctls.

This might also be useful if later you want to implement a mechanism 
where vCPUs can pause or resume, for example for multi-vCPU VMs.

You can implement this on top of what you have, but I highly recommend 
that you do it in the first version of what is committed to Linux.

Paolo

