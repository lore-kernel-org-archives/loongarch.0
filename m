Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4042125755
	for <loongarch@lists.linux.dev>; Mon, 11 Mar 2024 14:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710165734; cv=none; b=arILVZO3t7WpFdqF3k4W9qMbGvlGYAEDHWpF4tWy/XfANVbd+frnMrefdJBZI8qMfUjEiktiXaJDb8GBUTNaMyhgNm603viSPItVsRjhUuisb8jHeiF+2yNxmo70DR8Tdf3ec6qx8jEZUBsacRFeP6hoRuvEKNaA5ajCBEjzV/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710165734; c=relaxed/simple;
	bh=zudfJPfGKCSXtqr6xD9riAWqn5x9WVfEjygW7Pep6XY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eHJCVxJYLzMqyjSnKAwBcDZbrWNcpfpJwqSJ8jzoDuuS5LWJVrO/XTMjl5a5RorC47IYpSSwg8fOSemGAqN2g8RkWoh9vPlZrwM/yMNkaUv6U7IqRmerXAxHdrK+sR436CrdIYoEpsTyRNqbukwFrZc3Ahs710SgqdvQ2/i46Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WS4VDe4Q; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WS4VDe4Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710165732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=l1lWiVrfJ9gyOKGKxf4UnXuQxCW1HqyRc+4zMGSrV/I=;
	b=WS4VDe4QkhCgWEDd2pJNTLR8rM196JwtWsDjWlBx43lAjFWHdAnclrbTCA6UwV7LK+O3zQ
	hR6QC1z46M0Ul84eB89W/JN66MPFiho3tY/sZvPmLlsoj4WwyLCZKJj6VrSUtGLXENtep4
	EiKiZgwZtoYFGV+eXA9Jcrhj1a0up4g=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-360-PrpDu04YNimvwsQyCFluKw-1; Mon, 11 Mar 2024 10:02:10 -0400
X-MC-Unique: PrpDu04YNimvwsQyCFluKw-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5684345c0ebso2100557a12.1
        for <loongarch@lists.linux.dev>; Mon, 11 Mar 2024 07:02:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710165729; x=1710770529;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l1lWiVrfJ9gyOKGKxf4UnXuQxCW1HqyRc+4zMGSrV/I=;
        b=Q+Sgof4VP/QK3Y0PZjy/FHCYffjma0hry+lZztcRbzzjxDZLeQbw0Fno0hZMK0Aq4/
         +VJzXhOso+n9PpNu9RY6inaAz3Gv9i57JWKFcAmkPMvsIZF6WOkITTx3yCRjSqoF/2my
         K5HFsPYEtzwZHtUuN+DiPoGQBbS9gl+XAkkh5dGy2ZXARqOswjm2yu7hGfJB+4nhH2j4
         E7BJ9oPy4w6TxcsU3vPn5LBA3IKaZQv3wTPv3vKGbjeIyp81lSE/CtQrSH8wkbH7Roii
         wyK8Tt+qFkPwRUwkUWdiyPAnitHbz4+wDQm3KW+AjjBj75jzFlNc5v1bf6d/e+4QS5+b
         Epjw==
X-Forwarded-Encrypted: i=1; AJvYcCXODN6xR1/yvSDXkWTUlQjfbeoF5Vtp4seFS8cGD69HKWL6hYNJXNEaP2uCTYmig5BS99htulNhuzZqHayhGzWQRXe45xGjVX/h
X-Gm-Message-State: AOJu0YxUbcHueXWY0QxBMD6ZVSNoeTcqSFW3pORXoz066hVBCvD30Wlf
	OJ3hGRIbKygTlhsbTfHuQySBfu+uMeTjHTXsbbVtawtgSgKiO9VXeIcJCSsVM03uDC6lwH9YcYw
	qt44zmHuVGrCBcRiibb6R6FRg8pumbi125obfeKUbODIw1cCBXJDKcJrgcw==
X-Received: by 2002:a50:aacf:0:b0:568:145a:4a22 with SMTP id r15-20020a50aacf000000b00568145a4a22mr6746901edc.4.1710165729760;
        Mon, 11 Mar 2024 07:02:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhwYbM7JAcmCY0rptcO+QyNgjUt45vXfxZecF/gFi6BgI9yjqaxTSgh8WfEds4aQs8p50SPQ==
X-Received: by 2002:a50:aacf:0:b0:568:145a:4a22 with SMTP id r15-20020a50aacf000000b00568145a4a22mr6746863edc.4.1710165729367;
        Mon, 11 Mar 2024 07:02:09 -0700 (PDT)
Received: from [192.168.10.81] ([151.49.77.21])
        by smtp.googlemail.com with ESMTPSA id b2-20020aa7c902000000b00564e489ce9asm3016297edt.12.2024.03.11.07.02.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Mar 2024 07:02:08 -0700 (PDT)
Message-ID: <208e03b7-374b-4062-bed2-dda595fcad77@redhat.com>
Date: Mon, 11 Mar 2024 15:02:03 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] LoongArch KVM changes for v6.9
To: Huacai Chen <chenhuacai@loongson.cn>, Huacai Chen
 <chenhuacai@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>,
 Bibo Mao <maobibo@loongson.cn>
Cc: kvm@vger.kernel.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20240307144930.3919566-1-chenhuacai@loongson.cn>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20240307144930.3919566-1-chenhuacai@loongson.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/7/24 15:49, Huacai Chen wrote:
> The following changes since commit 90d35da658da8cff0d4ecbb5113f5fac9d00eb72:
> 
>    Linux 6.8-rc7 (2024-03-03 13:02:52 -0800)
> 
> are available in the Git repository at:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-kvm-6.9
> 
> for you to fetch changes up to b99f783106ea5b2f8c9d74f4d3b1e2f77af9ec6e:
> 
>    LoongArch: KVM: Remove unnecessary CSR register saving during enter guest (2024-03-06 09:12:13 +0800)

Pulled, thanks.

Paolo

> ----------------------------------------------------------------
> LoongArch KVM changes for v6.9
> 
> 1. Set reserved bits as zero in CPUCFG.
> 2. Start SW timer only when vcpu is blocking.
> 3. Do not restart SW timer when it is expired.
> 4. Remove unnecessary CSR register saving during enter guest.
> 
> KVM PV features are unfortunately missing in v6.9 for some
> implementation controversies, sigh.
> ----------------------------------------------------------------
> Bibo Mao (4):
>        LoongArch: KVM: Set reserved bits as zero in CPUCFG
>        LoongArch: KVM: Start SW timer only when vcpu is blocking
>        LoongArch: KVM: Do not restart SW timer when it is expired
>        LoongArch: KVM: Remove unnecessary CSR register saving during enter guest
> 
>   arch/loongarch/kvm/switch.S |  6 ------
>   arch/loongarch/kvm/timer.c  | 43 ++++++++++---------------------------------
>   arch/loongarch/kvm/vcpu.c   | 33 ++++++++++++++++++++++++++-------
>   3 files changed, 36 insertions(+), 46 deletions(-)
> 

