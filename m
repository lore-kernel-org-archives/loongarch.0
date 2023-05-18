Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3088217AB8
	for <loongarch@lists.linux.dev>; Thu, 18 May 2023 12:12:07 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-757807cb299so106889985a.2
        for <loongarch@lists.linux.dev>; Thu, 18 May 2023 05:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1684411926; x=1687003926;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b1LVde9eD9hiDa72aXFp01UeitZcx1XKK5VRIQwwJ4w=;
        b=f1WIjix4LVO2qoUadyymiNEwWX8LVYnKjiZJmHZsA00vpgp8OzN7fLeOXwmxyAsNjQ
         sHOCKYtaHjUeBnmA70xUS7m11Y8GXRs0HF7i7PVSFcwvUzQVx0yAXlGLYQrw7yq7y3KH
         MBoMqwZGJTzwuItitFkcFv88cqBCrBWri+DUGp8Fc0eAqXpc1sD7lY1vf9Zu0c1UnHTi
         g1NSzolGSvoeoheQrwHIwMvc3Rso4DvQpoRRtvFDk7J6iY3SLf6NCCF8S9IRrkOXhhUV
         HRuCy/CUe+KQ4Lk9dlGX7GSjHNglFJk4MTFkm4joUr1QsJe7so9IrOlgfq/tmei89LyY
         B2xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684411926; x=1687003926;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1LVde9eD9hiDa72aXFp01UeitZcx1XKK5VRIQwwJ4w=;
        b=fRKpeKbu+hZpsD5oRrC7hNJ0MF2MbniPXwkISBgC4pdvBPws/Nm6l2IrR9T3LsOyCD
         f9eSx1zoMhvRVBVemjToIBBnMWNCLu/GXbZQZlbB+trWvy46HA1DHsbqPuw6hh4TLwCQ
         SQv4sYeKAP9LUE0BDbSaFrKW4rmy7BorXv2WnqukeEBQSYT6L1hcUi1nHlfDNb9V2d5j
         mAHvDcgHu+IYOKUqZeDQ8RX35trAOxdbha2/QRKyVFpPoOWQd824fZ6teN2rYIwPRbwi
         BOR/Xjg7lhwdWe2sCVDYV1FDQRQyDu8t82IgE3YbxXelmsqJBnTYs6ubOf3FxYdIu3fs
         +nVg==
X-Gm-Message-State: AC+VfDziiBQafL/LA4HEtlmgIUFX+PtkfTv1fgUrJSzONLPtmqhdaYA2
	1WotoJAXvG19EPKDOer7m6ts3w==
X-Google-Smtp-Source: ACHHUZ7wZ7lgCFFjWmWBQuc0tx+WGJVC/VREvoop6Vbqh2gPTjnAeer0zQN00cudqqAWi4mVPLtPKg==
X-Received: by 2002:a05:6214:2486:b0:5fd:7701:88c5 with SMTP id gi6-20020a056214248600b005fd770188c5mr5974330qvb.6.1684411925806;
        Thu, 18 May 2023 05:12:05 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-25-194.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.25.194])
        by smtp.gmail.com with ESMTPSA id w8-20020a0562140b2800b006215c5bb2e9sm476635qvj.70.2023.05.18.05.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 05:12:05 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1pzcUG-0055VE-PF;
	Thu, 18 May 2023 09:12:04 -0300
Date: Thu, 18 May 2023 09:12:04 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
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
	Catalin Marinas <catalin.marinas@arm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
	David Hildenbrand <david@redhat.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	"David S. Miller" <davem@davemloft.net>,
	Richard Weinberger <richard@nod.at>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 00/34] Split ptdesc from struct page
Message-ID: <ZGYWFIfyDtdpeWg1@ziepe.ca>
References: <20230501192829.17086-1-vishal.moola@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230501192829.17086-1-vishal.moola@gmail.com>

On Mon, May 01, 2023 at 12:27:55PM -0700, Vishal Moola (Oracle) wrote:
> The MM subsystem is trying to shrink struct page. This patchset
> introduces a memory descriptor for page table tracking - struct ptdesc.
> 
> This patchset introduces ptdesc, splits ptdesc from struct page, and
> converts many callers of page table constructor/destructors to use ptdescs.

Lightly related food for future thought - based on some discussions at
LSF/MM it would be really nice if an end result of this was that a
rcu_head was always available in the ptdesc so we don't need to
allocate memory to free a page table.

Jason
