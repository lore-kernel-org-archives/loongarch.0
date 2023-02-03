Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323B329A8
	for <loongarch@lists.linux.dev>; Fri,  3 Feb 2023 14:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675434698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/decAsXzWzOr1Fn5getBDCGr7TKXQO+f4q0N0MxWErI=;
	b=FN9TAsxOKcK+N/WrLynTxPqRzyZ7ZRNHuqft9mJ0O7QKTw0/sg1jI+oMEp3FpT9C12A0X/
	tYDCgKP4uvL7po41MunDlFfim7JhA522dXj1HiRikdi43cH6obdzeIw9BP6nWINLN6U7xO
	6FmAm7tVEOpVf9O4l7euWf+L1SjVvrU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-649-5cvMKUMeOgipB2afLwuVPQ-1; Fri, 03 Feb 2023 09:31:36 -0500
X-MC-Unique: 5cvMKUMeOgipB2afLwuVPQ-1
Received: by mail-wm1-f72.google.com with SMTP id bg32-20020a05600c3ca000b003dc0df8c77dso2697089wmb.6
        for <loongarch@lists.linux.dev>; Fri, 03 Feb 2023 06:31:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/decAsXzWzOr1Fn5getBDCGr7TKXQO+f4q0N0MxWErI=;
        b=ZeRmGP0i0uOcVo3jJGoaHeN6QxMlv4r0M3U9O2XfY/M/tHD1hH5XAPCRt74ixr6NC2
         99mtPok53t6WLZ838Pjf8aT5xZa4AlUIZjEOkT+adP5tRMNBtlJctHeAUsfBFAqf5KeM
         etQuxJugk1PYHIKjrEHew8mA0lvg9j/aTyJXxisWuO1FD9oFGvUNBSww+Zal6f5gdLRP
         JZtZoL8+5Qob+NPjhlpPsjG8N8I/ymcU9GIGEn+Z/Ikk+v8mZ9pPkV7tIuHsmfSSHuzV
         /3nWTNPRraezcWO4fYbzGsyj59vTmTk0xmUnfdwwSCG7v81iV1RuzAs1CmtWzW5G9IV4
         xN5w==
X-Gm-Message-State: AO0yUKVpWRpCynhiHTfyMyOILVPXM9X/RFFtr9fnZumF3/OKHVn1cih9
	Da6yefs8NJLGPqXvoPXOoWHdbUTVr3XyV89OoSZeS0P/Mum+oI7KgCUaQ1tyX2KaqI3L/ewaH2r
	lZ1pcJyRJdQhQTtXWLoxJ
X-Received: by 2002:a05:600c:4747:b0:3df:e549:bd27 with SMTP id w7-20020a05600c474700b003dfe549bd27mr3634984wmo.6.1675434695218;
        Fri, 03 Feb 2023 06:31:35 -0800 (PST)
X-Google-Smtp-Source: AK7set/qkaMfF+TBCgvbwgP2CGu2sIJoLRpl09HLMUmy0eiiBTILy4lbS6cT+HBgr82lyryc+pIpNQ==
X-Received: by 2002:a05:600c:4747:b0:3df:e549:bd27 with SMTP id w7-20020a05600c474700b003dfe549bd27mr3634941wmo.6.1675434694897;
        Fri, 03 Feb 2023 06:31:34 -0800 (PST)
Received: from [192.168.3.108] (p5b0c6376.dip0.t-ipconnect.de. [91.12.99.118])
        by smtp.gmail.com with ESMTPSA id q9-20020a1ce909000000b003dc34edacf8sm7704293wmc.31.2023.02.03.06.31.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 06:31:34 -0800 (PST)
Message-ID: <1d13abeb-ea4b-6314-2fd2-1b86b8f4d6c5@redhat.com>
Date: Fri, 3 Feb 2023 15:31:32 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 3/4] mips: drop definition of pfn_valid() for
 DISCONTIGMEM
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Brian Cain <bcain@quicinc.com>,
 "David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer
 <gerg@linux-m68k.org>, Guo Ren <guoren@kernel.org>,
 Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
 Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Rich Felker <dalias@libc.org>,
 Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>,
 Stafford Horne <shorne@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vineet Gupta <vgupta@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-alpha@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, linuxppc-dev@lists.ozlabs.org,
 loongarch@lists.linux.dev, openrisc@lists.librecores.org,
 sparclinux@vger.kernel.org, x86@kernel.org
References: <20230129124235.209895-1-rppt@kernel.org>
 <20230129124235.209895-4-rppt@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230129124235.209895-4-rppt@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29.01.23 13:42, Mike Rapoport wrote:
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> 
> There is stale definition of pfn_valid() for DISCONTINGMEM memory model
> guarded !FLATMEM && !SPARSEMEM && NUMA ifdefery.
> 
> Remove everything but definition of pfn_valid() for FLATMEM.
> 
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

