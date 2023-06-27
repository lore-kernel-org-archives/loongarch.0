Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4E44A26
	for <loongarch@lists.linux.dev>; Tue, 27 Jun 2023 19:10:24 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5577900c06bso3673302a12.2
        for <loongarch@lists.linux.dev>; Tue, 27 Jun 2023 12:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687893024; x=1690485024;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=yS/xmFpqe6+k8T+yWQv7frf8UxF7B6Cm+1CNfhqUPlA=;
        b=BMqSkVfZP75OxNlOqvaghKGJv9m0y4sm8KFw5SHceiXFQz/e0SiiKJT9I5B52iAH17
         cMt4KC2GjU9iq0SnaoF95JUsMa0mk+JEcq2FkRIOzoow88IvYkDfH7aBL3K5PbCOKOue
         txhLzT7BLkzfYn4DxxqSwsZ2KmDA6ILNOIWpC3UOJTW+EHWbeQQdlcmGoaBUyJofM5AY
         lnVmBNLdubBt20V6jFfi37xAvQhhTT8MryCyACblmLywm5IjXVYJCWSIUi3pbGc+j98S
         r4FtzORgbma5+HwlZ2RT9hRW9y3a8jxCdKlGNGBWvRri5+DzenA7COAJXTL5/EtGEK0g
         cong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687893024; x=1690485024;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yS/xmFpqe6+k8T+yWQv7frf8UxF7B6Cm+1CNfhqUPlA=;
        b=aKqzSUO3N1QT7r5m9bKbH+qtZHxPxeZmrU68cYJk9NFh5/M0Xipy+DFBsT+LapieTb
         tmfj9mI+BJ7Z2piQdo5xIM63zWDpQbq5nCt8RKaMfm2Tr6uQ5bSJmgZkmXBJnI+7n3SU
         NFMgIbzB0iWv7wM+WEFeZDARYYCUJIKNT8mMpnytxcJYdVV+xlIUVCjGWGmjIwEDh6Ij
         6ZYLASVMotYIyrPqHPdDSv6NEg7SAN441rHeUR1Eu9aGpaTX4S8VE8Xz2pcjAQA4hF20
         Lj4noKA1Bbfqeh+a+5MIBUEpzrNj6q6F/9karfVhGaI4tXQmNbYn+XFe1076Ap0H++Vx
         Qeag==
X-Gm-Message-State: AC+VfDz5IuAXTy/nHT6dOebnzHSqnTpcJmexIhs21Nu6lQ8z9TtPdwIo
	tJHMgtDmzjQqhoEsW9aUsXg=
X-Google-Smtp-Source: ACHHUZ4TyTsIrCRAZ6UdXT5Omt1I9QGIq3lGO+AmEbof8hKm4unG6pcuoo4CdZZ1APibznjic8nqlQ==
X-Received: by 2002:a17:90a:3cc6:b0:262:df8e:fcb6 with SMTP id k6-20020a17090a3cc600b00262df8efcb6mr9240150pjd.43.1687893024298;
        Tue, 27 Jun 2023 12:10:24 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n91-20020a17090a5ae400b002471deb13fcsm6684270pji.6.2023.06.27.12.10.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 12:10:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <cc954b15-63ab-9d9f-2d37-1aea78b7f65f@roeck-us.net>
Date: Tue, 27 Jun 2023 12:10:20 -0700
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v5 26/33] nios2: Convert __pte_free_tlb() to use ptdescs
Content-Language: en-US
To: Vishal Moola <vishal.moola@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 Hugh Dickins <hughd@google.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Mike Rapoport <rppt@kernel.org>
References: <20230622205745.79707-1-vishal.moola@gmail.com>
 <20230622205745.79707-27-vishal.moola@gmail.com>
 <13bab37c-0f0a-431a-8b67-4379bf4dc541@roeck-us.net>
 <CAOzc2px6VutRkMUTn+M5LFLf1YbRVZFgJ=q7StaApwYRxUWqQA@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <CAOzc2px6VutRkMUTn+M5LFLf1YbRVZFgJ=q7StaApwYRxUWqQA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/27/23 10:42, Vishal Moola wrote:
> On Mon, Jun 26, 2023 at 10:47 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On Thu, Jun 22, 2023 at 01:57:38PM -0700, Vishal Moola (Oracle) wrote:
>>> Part of the conversions to replace pgtable constructor/destructors with
>>> ptdesc equivalents.
>>>
>>> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
>>> Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
>>
>> This patch causes all nios2 builds to fail.
> 
> It looks like you tried to apply this patch on its own. This patch depends
> on patches 01-12 of this patchset to compile properly. I've cross-compiled
> this architecture and it worked, but let me know if something fails
> when its applied on top of those patches (or the rest of the patchset).


No, I did not try to apply this patch on its own. I tried to build yesterday's
pending-fixes branch of linux-next.

Guenter

