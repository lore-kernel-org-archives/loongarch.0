Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421F233E3
	for <loongarch@lists.linux.dev>; Wed, 25 Oct 2023 23:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Oyl/Mjs/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698278088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=TIintWgJTfboQO5OTuPzrdngusig1vFIFKO8N+OxmI8=;
	b=Oyl/Mjs/0mS0sR4k7SLz2AWdg1aLFHJIHzIwehiv3qhqqZvs06Z426GddAaJ4MhxezRmir
	6mG0f7rcJzfWMTR3LZ753mHoDlNx/3ElNXBcwuzE8hjXomsJDHH5cN4d9b78bSh1x3Y/sb
	zjoXosOIY25gqCoLaVWdYFUTi4Xz9R8=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-149-cxmxUYqOPPG65nebqVA65g-1; Wed, 25 Oct 2023 19:54:46 -0400
X-MC-Unique: cxmxUYqOPPG65nebqVA65g-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-778915a0c73so43105885a.1
        for <loongarch@lists.linux.dev>; Wed, 25 Oct 2023 16:54:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698278086; x=1698882886;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TIintWgJTfboQO5OTuPzrdngusig1vFIFKO8N+OxmI8=;
        b=Gv+rT0QKN6VE5wrUh995Q+9oComRuKlTaRatcwJ8GR9O2TWgEhP/qBFXYPjsymhTkB
         e0QbincL5usE/JPpUu/NxrV5f2D+DpoKBYYh/Z6XNBwgbGhGJvi/EhV2vaxjLl35viQ4
         QRTOmJdzqVC1CKmljUXsv4pRG0K2TLkuAtrtzQ8TWvu2+jvAinB05U9AO8PbC5/BXbf/
         t5Ghn7CWLitORSgg6Wl+Akju9yH3qAdM5DcaT8Nz49THdtRcflXWq5zZxvMDBbr5o4eW
         t6mby8z+5h6JlhY42/1UoWAxNKG6RAhDt7hZqR8rqU2yQbVGqNyznfqPyZsQP+6BfA07
         dNeQ==
X-Gm-Message-State: AOJu0YxrSrj5MifIGRNjv4bqArdm2t35qzHJOuKGNXFrSoReJ6k2Sh01
	T9rfmmBLYU0KsK2AVEz78gyhdjoHt4rHQ5BSc8X5VmN1eWPwwurRZdHBeY6Txl8EgzOv3SA0dLL
	nN8E89vW5w+h7Y4d/JCDxhCNGEZtG
X-Received: by 2002:a05:620a:5627:b0:778:91f0:e559 with SMTP id vv7-20020a05620a562700b0077891f0e559mr14623238qkn.78.1698278086031;
        Wed, 25 Oct 2023 16:54:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEG8buWnXa1t3csI9uuGtHq1Kkfm/iFDo8HA+qc6SHQk1q5HQs4phEeyxxaDi4lZR9R6mmHJA==
X-Received: by 2002:a05:620a:5627:b0:778:91f0:e559 with SMTP id vv7-20020a05620a562700b0077891f0e559mr14623224qkn.78.1698278085713;
        Wed, 25 Oct 2023 16:54:45 -0700 (PDT)
Received: from [172.19.0.201] ([192.80.84.35])
        by smtp.googlemail.com with ESMTPSA id qp8-20020a05620a388800b0077423f849c3sm4600064qkn.24.2023.10.25.16.54.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Oct 2023 16:54:45 -0700 (PDT)
Message-ID: <791d3b77-8a4d-4c5e-88db-f38843d37098@redhat.com>
Date: Thu, 26 Oct 2023 01:54:44 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] LoongArch KVM changes for v6.7
To: Huacai Chen <chenhuacai@kernel.org>, Huacai Chen <chenhuacai@loongson.cn>
Cc: kvm@vger.kernel.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20231005091825.3207300-1-chenhuacai@loongson.cn>
 <CAAhV-H7VN_r-SzEMK6LHqXzVbNemZYuYYLb2mri=EGZ7qb3C3A@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <CAAhV-H7VN_r-SzEMK6LHqXzVbNemZYuYYLb2mri=EGZ7qb3C3A@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/25/23 04:10, Huacai Chen wrote:
> Hi, Paolo, Excuse me, but this is just a gentle reminder. The 6.7 merge 
> window is coming soon, have you missed this PR mail? Or should I rebase 
> to 6.6-rc7 to send a new PR (a randconfig build error is fixed in 6.6-rc7)?

Hi,

I am expecting some changes to Kconfig for 6.7 and wanted to pull this 
second, to solve the conflicts.

There is no need to rebase, but it would be useful to point me to the 
fix in 6.6-rc7.

Paolo

