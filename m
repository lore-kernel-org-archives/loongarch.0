Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBEB8465
	for <loongarch@lists.linux.dev>; Tue, 28 Mar 2023 14:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680012824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+E8HtZqTun8UNt8XZcvENJSCBWpeQntcGXMLkFXrU3g=;
	b=h7ZwJ+bkLupsPQhmuRzYNKRgKgd9LpwVQuA6IxM+HS3SoEFvB7JsoSRrSquhic8i4qo1pp
	TfBeJxAtm4NleARp8MJcYbDuNPwfKHb1Ab7x4oPEGy6f0Cb45JcOsJ3IEoV+1qshsjVFgR
	HS2bt3lXhU3XRShN7rnirXvV5+mfRi4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-YhfwicaOPPiuFepuwfb_Kw-1; Tue, 28 Mar 2023 10:13:43 -0400
X-MC-Unique: YhfwicaOPPiuFepuwfb_Kw-1
Received: by mail-ed1-f70.google.com with SMTP id i22-20020a05640242d600b004f5962985f4so17990317edc.12
        for <loongarch@lists.linux.dev>; Tue, 28 Mar 2023 07:13:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680012822;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+E8HtZqTun8UNt8XZcvENJSCBWpeQntcGXMLkFXrU3g=;
        b=H3paOL3o85riCMMYpt9rQcBbeiPnT11BXxY25bTCqPEAvvkXOlpuaskeEd7hhus6gs
         iFnjTl9gQC4XKua3gM0yzlvKWMA0Z54AZf3WN+0teaJHQFFzMsf66LquKg/+CMkfa6ft
         sdoqqYvdyb06poVVhivHLDdUrIcIdoZPUYryf59XNKQpu5A4A9nrxU8aIt0nCC6tLwUJ
         S0hG9yg7pJpWAJCdGFKhUbyppUtoH87I91DeXIxv38jRQcgTJ80gOuCTthDN7wYzlLZt
         siifHEIfUe+DDheqK3nv5JBSPq5O9E/BDcQE3mx5MMCVt/J0M0zitfMC+kPyaTC5cgfg
         Xqag==
X-Gm-Message-State: AAQBX9fuefprfJU0ewyYHL/pSelANkvefQwXpoIEf2ZLtZMtO5AvHagD
	rHAOQmc+FEdBvi8tlZ/1blZX8utbEeZgiok6IXsyUYKhZ1vLbt4ScSiHdfdGeYPjoI8jBATLBn8
	b+t5Kmdqsqm5Z8b/XVJl5
X-Received: by 2002:a17:907:8a08:b0:944:44d:c736 with SMTP id sc8-20020a1709078a0800b00944044dc736mr12059623ejc.64.1680012821900;
        Tue, 28 Mar 2023 07:13:41 -0700 (PDT)
X-Google-Smtp-Source: AKy350bq4jWUmHpYItDc9v2j+gaXcLGVHaVKbHyNxW/udCKRUqQ5mrD9MVmzHsiurNkpWO6mf3ruIQ==
X-Received: by 2002:a17:907:8a08:b0:944:44d:c736 with SMTP id sc8-20020a1709078a0800b00944044dc736mr12059587ejc.64.1680012821634;
        Tue, 28 Mar 2023 07:13:41 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c? ([2001:b07:6468:f312:1c09:f536:3de6:228c])
        by smtp.googlemail.com with ESMTPSA id u23-20020a170906409700b009334a6ef3e8sm13334074ejj.141.2023.03.28.07.13.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 07:13:41 -0700 (PDT)
Message-ID: <55c79f33-2549-38eb-f868-8e6141d7d322@redhat.com>
Date: Tue, 28 Mar 2023 16:13:39 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PING PATCH v4 27/29] LoongArch: KVM: Implement vcpu world switch
To: Tianrui Zhao <zhaotianrui@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Mark Brown <broonie@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Oliver Upton <oliver.upton@linux.dev>, maobibo@loongson.cn,
 Xi Ruoyao <xry111@xry111.site>
References: <20230328123119.3649361-1-zhaotianrui@loongson.cn>
 <20230328123119.3649361-28-zhaotianrui@loongson.cn>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230328123119.3649361-28-zhaotianrui@loongson.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/28/23 14:31, Tianrui Zhao wrote:
> + * prepare switch to guest
> + * @param:
> + *  KVM_ARCH: kvm_vcpu_arch, don't touch it until 'ertn'
> + *  GPRNUM: KVM_ARCH gpr number

Stale comment (should be "a2: kvm_vcpu_arch, don't touch it until 'ertn'").

Since you are at it, I noticed now that tmp and tmp1 aren't too useful 
because all registers will be overwritten before the end of the macro. 
You choose whether to keep or remove them.

Paolo

> + *  tmp, tmp1: temp register
> + */

