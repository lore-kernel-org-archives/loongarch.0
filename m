Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45ED146BB
	for <loongarch@lists.linux.dev>; Fri,  1 Dec 2023 03:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UP3MBh3s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701402447;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Q5xYcnLhhl5wab+9SUNf2YG1+1AQAaLiKPAT2IR83M=;
	b=UP3MBh3shXUPVy6C6AbKCR+eTR8NqSI4CwZCF+6Kw5J2DSDVaEv0fSwLN90wQW7LbbqOT/
	DXCBbHmymPz3H7SpUQQgPgaiB7TSfibtjs6JqW8FckbZXKB6MU2T6wdYjs1M8SIPnfsi9B
	r/YP7vrSNLsC49JlP+QJ6zKgcozF6MA=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-44-SJwfBbb9Pl6vWa3v5x4VaA-1; Thu, 30 Nov 2023 22:47:23 -0500
X-MC-Unique: SJwfBbb9Pl6vWa3v5x4VaA-1
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-5c6072bc218so122262a12.1
        for <loongarch@lists.linux.dev>; Thu, 30 Nov 2023 19:47:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701402442; x=1702007242;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Q5xYcnLhhl5wab+9SUNf2YG1+1AQAaLiKPAT2IR83M=;
        b=VFgIX8z3ZlKxddOD9qO2BCwCoSs6hNyR0i6EBLaqm5WkPNg26wLh3jZizOkgwf+Eqd
         ixZq8Lir4SgRsgGV6VoCF0/5iz6mQ2HgjObBkdJ+0srESO2JXM+9/sl+iveogYXMjwd0
         jAm7eRSzdbAQeEBzbwTC/ZL7JyPxVG/NiZk4FseUeatOFsohY9/NCoV2gV2f+bLp8Wie
         7nOxM8mbuBEVj4HIpjIkqVOWmNgZPy87Ohdu15XncY9ddFb9Zsl/bw73Th4wBdTWx7IH
         0TnbW3NzeXG5qKnNi/hDb+jfUlzBlAuVKcl/hy2jQaxbvXIXehgE3UDd9cNkyK53EyBA
         wJog==
X-Gm-Message-State: AOJu0YztC9JHxjSGVr5gr/aj+Pdg6m2jskrm1N/TM2082t4UQjvoIpKp
	qKHPKXESPW44V4TDX3WZyE0iEcdQ9yIfTOyrwOwz4boYy8WLGdMtVDirW8+g5iRuynEe37KKt0D
	GSQb3tUE328cLbKBfTE+d
X-Received: by 2002:a17:902:d2cb:b0:1cf:de3e:e4c9 with SMTP id n11-20020a170902d2cb00b001cfde3ee4c9mr23769899plc.29.1701402442613;
        Thu, 30 Nov 2023 19:47:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFFc/FRI9UHJwfBJxYeFRAhPaME7NIPXUpzMmMZaQsrSUZaHXjj5IgT1PfH3h0ARxutVZDmxg==
X-Received: by 2002:a17:902:d2cb:b0:1cf:de3e:e4c9 with SMTP id n11-20020a170902d2cb00b001cfde3ee4c9mr23769867plc.29.1701402442296;
        Thu, 30 Nov 2023 19:47:22 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
        by smtp.gmail.com with ESMTPSA id p5-20020a170902e74500b001cfc1a593f7sm2185691plf.217.2023.11.30.19.47.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Nov 2023 19:47:21 -0800 (PST)
Message-ID: <8c3ca6c7-fa5f-4f45-b36d-1c7d9d94c918@redhat.com>
Date: Fri, 1 Dec 2023 14:47:11 +1100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/21] drivers: base: Implement weak arch_unregister_cpu()
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
 linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev, x86@kernel.org,
 linux-csky@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org
Cc: Salil Mehta <salil.mehta@huawei.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, jianyong.wu@arm.com,
 justin.he@arm.com, James Morse <james.morse@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <ZVyz/Ve5pPu8AWoA@shell.armlinux.org.uk>
 <E1r5R3H-00CszC-2n@rmk-PC.armlinux.org.uk>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <E1r5R3H-00CszC-2n@rmk-PC.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/22/23 00:44, Russell King (Oracle) wrote:
> From: James Morse <james.morse@arm.com>
> 
> Add arch_unregister_cpu() to allow the ACPI machinery to call
> unregister_cpu(). This is enough for arm64, riscv and loongarch, but
> needs to be overridden by x86 and ia64 who need to do more work.
> 
> CC: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Signed-off-by: James Morse <james.morse@arm.com>
> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> An open question remains from the RFC v2 posting: should we provide a
> __weak stub for !HOTPLUG_CPU as well, since in later patches ACPI may
> reference this if the compiler doesn't optimise as we expect?
> 
> Changes since v1:
>   * Added CONFIG_HOTPLUG_CPU ifdeffery around unregister_cpu
> Changes since RFC v2:
>   * Move earlier in the series
> ---
>   drivers/base/cpu.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

