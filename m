Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469F7188
	for <loongarch@lists.linux.dev>; Mon, 11 Sep 2023 07:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1694417414; bh=aPvXZ8bHbYLxG5l3+8llo0L+w6f6J2a8wRs7OiYuIUI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=shqai/KGP8HDVI2KnXkk1MWU62d8q4DUbdfgg6mewf1wAPxiNQUqfE8huzt+a/UPc
	 r+cuoijeFnSxV8tPhUTbMTucw7TCMPhwFmUeNIn9o03BQKLiCdlAb6ZNtMqd/j4lXk
	 84JonrpL9OGUuxdHwtDd4zQcbs81FTNd1MhRzEnY=
Received: from [28.0.0.1] (unknown [101.82.59.96])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 07F23600DA;
	Mon, 11 Sep 2023 15:30:12 +0800 (CST)
Message-ID: <1c66bd8b-4be7-8296-6fd8-aa206476f017@xen0n.name>
Date: Mon, 11 Sep 2023 15:30:11 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v20 28/30] LoongArch: KVM: Enable kvm config and add the
 makefile
Content-Language: en-US
To: Tianrui Zhao <zhaotianrui@loongson.cn>, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, loongarch@lists.linux.dev,
 Jens Axboe <axboe@kernel.dk>, Mark Brown <broonie@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Oliver Upton <oliver.upton@linux.dev>, maobibo@loongson.cn,
 Xi Ruoyao <xry111@xry111.site>, kernel test robot <lkp@intel.com>
References: <20230831083020.2187109-1-zhaotianrui@loongson.cn>
 <20230831083020.2187109-29-zhaotianrui@loongson.cn>
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <20230831083020.2187109-29-zhaotianrui@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/31/23 16:30, Tianrui Zhao wrote:
> [snip]
> +
> +config AS_HAS_LVZ_EXTENSION
> +	def_bool $(as-instr,hvcl 0)

Upon closer look it looks like this piece could use some improvement as 
well: while presence of "hvcl" indeed always implies full support for 
LVZ instructions, "hvcl" however isn't used anywhere in the series, so 
it's not trivially making sense. It may be better to test for an 
instruction actually going to be used like "gcsrrd". What do you think?

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

