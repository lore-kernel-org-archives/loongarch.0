Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E94C1380
	for <loongarch@lists.linux.dev>; Tue, 21 Feb 2023 07:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676965561;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fMy5UNnfOflKNYu2v+qdc7M5+Dbw9HBEzHEBe6W2kQU=;
	b=Hz1vTFEKSUYSBuVLxNJC2Lic/2bjMIp5mNU+/8aej5cZ7YNnDvztnktzgEVqoCHv2pOK2f
	eWsjmoK1FIln4fiTHnlmBYwSylPYXsZiruaFfU2zA7s/xIokwAXsfNI+5ndNixZ95aWw50
	s3fRnLE+V0ngzfIqzv3V1yWppuMLu+o=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-178-yZCJTrWBNsaEB_veL0Zr2g-1; Tue, 21 Feb 2023 02:45:59 -0500
X-MC-Unique: yZCJTrWBNsaEB_veL0Zr2g-1
Received: by mail-ed1-f71.google.com with SMTP id en10-20020a056402528a00b004acbf564d75so4039384edb.5
        for <loongarch@lists.linux.dev>; Mon, 20 Feb 2023 23:45:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fMy5UNnfOflKNYu2v+qdc7M5+Dbw9HBEzHEBe6W2kQU=;
        b=0lSibc2aGW5prq/9gZdX3QyBcqFZobclAyViS6uGlLa8bRsp+B5FIfqnpZ/hOKzeJ/
         j8B7pjABxgicshyNOFYwcRoSSGiKQkTQmq1LmZyCmO8YCQ3Kc7YUUIhKpGIgake30SvU
         CJm3cN3NK6CkT6bMn+VcCpvastHMD26gHhJ2c8dj6GVYalwLE4B1DM2Mm3czaUIvqJiK
         1y3oUaNr0lJ1WPj12LNqPIjD9kCl45nJ4mjFYQtKnahlo2D7k8+pNvi4LWlrc/h/rDEY
         07SY2ZuB05pWGutxtN1HSaqyNBOHpwmQBFI48BzZEM8pHJsIZUZqLctKfgpeS+mdRSXM
         LfGg==
X-Gm-Message-State: AO0yUKWWT0U/HhR3I4ZjQ0X9CESxs9g/VkyKttvLl0GM3iZV3tTkDgVN
	i6Na6mMxhuNQmXimH4LNBM3aRmp/BoBXuY39mt6nKddxBPR+H6rX37K+fG3gw8PRQBUE2RuHU9H
	Y2FvCArmAKfTz3cKY5oKN
X-Received: by 2002:a17:906:9f25:b0:8b1:4d5f:fb83 with SMTP id fy37-20020a1709069f2500b008b14d5ffb83mr11855610ejc.15.1676965558366;
        Mon, 20 Feb 2023 23:45:58 -0800 (PST)
X-Google-Smtp-Source: AK7set9vghZQIt75cz8byQ+eUxaqXScW0PwKtItzq1+Ju4htLOU5T5BIIbIDPeiHMzCc1djkwXl0yg==
X-Received: by 2002:a17:906:9f25:b0:8b1:4d5f:fb83 with SMTP id fy37-20020a1709069f2500b008b14d5ffb83mr11855591ejc.15.1676965558066;
        Mon, 20 Feb 2023 23:45:58 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045? ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
        by smtp.googlemail.com with ESMTPSA id uj9-20020a170907c98900b008deba75e89csm559987ejc.66.2023.02.20.23.45.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Feb 2023 23:45:57 -0800 (PST)
Message-ID: <50575db8-efb8-2d56-5dd9-fe4318db2af3@redhat.com>
Date: Tue, 21 Feb 2023 08:45:56 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 27/29] LoongArch: KVM: Implement vcpu world switch
To: Tianrui Zhao <zhaotianrui@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Mark Brown <broonie@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Oliver Upton <oliver.upton@linux.dev>, maobibo@loongson.cn
References: <20230220065735.1282809-1-zhaotianrui@loongson.cn>
 <20230220065735.1282809-28-zhaotianrui@loongson.cn>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230220065735.1282809-28-zhaotianrui@loongson.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/20/23 07:57, Tianrui Zhao wrote:
> +	/* Load Guest gprs */
> +	ld.d    $r1,   \KVM_ARCH,  (KVM_ARCH_GGPR + 8 * 1)
> +	ld.d    $r2,   \KVM_ARCH,  (KVM_ARCH_GGPR + 8 * 2)
> +	ld.d    $r3,   \KVM_ARCH,  (KVM_ARCH_GGPR + 8 * 3)
> +	ld.d    $r4,   \KVM_ARCH,  (KVM_ARCH_GGPR + 8 * 4)
> +	ld.d    $r5,   \KVM_ARCH,  (KVM_ARCH_GGPR + 8 * 5)
> +	ld.d    $r7,   \KVM_ARCH,  (KVM_ARCH_GGPR + 8 * 7)
> +	ld.d    $r8,   \KVM_ARCH,  (KVM_ARCH_GGPR + 8 * 8)
> +	ld.d    $r9,   \KVM_ARCH,  (KVM_ARCH_GGPR + 8 * 9)
> +	ld.d    $r10,  \KVM_ARCH,  (KVM_ARCH_GGPR + 8 * 10)
> +	ld.d    $r11,  \KVM_ARCH,  (KVM_ARCH_GGPR + 8 * 11)
> +	ld.d    $r12,  \KVM_ARCH,  (KVM_ARCH_GGPR + 8 * 12)
> +	ld.d    $r13,  \KVM_ARCH,  (KVM_ARCH_GGPR + 8 * 13)
> +	ld.d    $r14,  \KVM_ARCH,  (KVM_ARCH_GGPR + 8 * 14)
> +	ld.d    $r15,  \KVM_ARCH,  (KVM_ARCH_GGPR + 8 * 15)
> +	ld.d    $r16,  \KVM_ARCH,  (KVM_ARCH_GGPR + 8 * 16)
> +	ld.d    $r17,  \KVM_ARCH,  (KVM_ARCH_GGPR + 8 * 17)
> +	ld.d    $r18,  \KVM_ARCH,  (KVM_ARCH_GGPR + 8 * 18)
> +	ld.d    $r19,  \KVM_ARCH,  (KVM_ARCH_GGPR + 8 * 19)
> +	ld.d    $r20,  \KVM_ARCH,  (KVM_ARCH_GGPR + 8 * 20)
> +	ld.d    $r21,  \KVM_ARCH,  (KVM_ARCH_GGPR + 8 * 21)
> +	ld.d    $r22,  \KVM_ARCH,  (KVM_ARCH_GGPR + 8 * 22)
> +	ld.d    $r23,  \KVM_ARCH,  (KVM_ARCH_GGPR + 8 * 23)
> +	ld.d    $r24,  \KVM_ARCH,  (KVM_ARCH_GGPR + 8 * 24)
> +	ld.d    $r25,  \KVM_ARCH,  (KVM_ARCH_GGPR + 8 * 25)
> +	ld.d    $r26,  \KVM_ARCH,  (KVM_ARCH_GGPR + 8 * 26)
> +	ld.d    $r27,  \KVM_ARCH,  (KVM_ARCH_GGPR + 8 * 27)
> +	ld.d    $r28,  \KVM_ARCH,  (KVM_ARCH_GGPR + 8 * 28)
> +	ld.d    $r29,  \KVM_ARCH,  (KVM_ARCH_GGPR + 8 * 29)
> +	ld.d    $r30,  \KVM_ARCH,  (KVM_ARCH_GGPR + 8 * 30)
> +	ld.d    $r31,  \KVM_ARCH,  (KVM_ARCH_GGPR + 8 * 31)
> +	/* Load KVM_ARCH register */
> +	ld.d	\KVM_ARCH, \KVM_ARCH, (KVM_ARCH_GGPR + 8 * \GPRNUM)

This in practice relies on KVM_ARCH being a2 so please remove the 
KVM_ARCH and GPRNUM arguments from the macro; just replace \KVM_ARCH 
with a2 as needed.

Also, in these ld.d and st.d sequences you may want to use the ABI names 
instead of the rNN names, so it's clearer that you are skipping the 
KVM_ARCH register.

Paolo

