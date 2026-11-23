Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795475406;
	b=XlPwp4aPVCGnurJUdVPCEdPR1aWCI93StaSavcBwt82fz/GSyAiRiXrtFOGvECe1mAsU
	 2lxYJ3Lf4HVNJxJD3HP3l5SGT6wNv4w04ZujXlekKYEaialndWIEqz5mEaM5OS6nIGOuv
	 KtarjZ+VEP1w/2ubfkTc65KzKXtasqlgM0Fcd6YC8FGghPupDAuEJHGdVcNL2YNNk/TtT
	 /AOSVA/q7tOpUgLOgDO9nQt86jn6fnNoHcGrXElXJD9h7WLKV+C5JV2HbrlGA5HhVtIIi
	 xPvX8hR1aewmL+m5GtLrzXWPStXRGyrwQpo3dBn1I9Az39zjiDBmnU9U9gCS4Ywwsvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795475406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:X-Google-Original-Date:Subject:In-Reply-To:CC:From:To:Message-ID:
	 Mime-Version:Content-Type:Content-Transfer-Encoding;
	bh=1b1ocgQtSvefIuPciX0StsHzdHu/105xpXIeUHjXub4=;
	b=KkGkNxK6LgUV8+2YDMcfEeKPR09GavYA1PmB0kAPETjmMT7KIOjHmkkcPBAfUjVOWWO7
	 zK+xhfGaXtxOWhfqSTeDGeFsY31IL/LUqQpw/12D1yZm2kvlzXs5im8cyTh6obrP4f433
	 NDm0k8zokMAsAAawxPMKR2H0UI1oXy1kUZNRIc3mdtssMq2gc9OMMoD57qxloGmiUJtYG
	 NkGk8UqHLNQfmF75GWL48Sp4rSEq3MvylMFS8TNIST+TcJaA/Nbl4LJUbQQVbCm9J5dlV
	 QZm2NBj6qFlVQAtXrSu8ztYT78nk4UQPrasgH1ONHd80ON66/gUz8/yehO6dFiSp38w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dabbelt.com;
	spf=pass smtp.mailfrom=dabbelt.com;
	dkim=pass header.d=dabbelt-com.20260707.gappssmtp.com header.i=@dabbelt-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=mF5ATrFD;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D1E606A327
	for <loongarch@lists.linux.dev>; Mon, 23 Nov 2026 23:10:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9D1E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20260707.gappssmtp.com header.i=@dabbelt-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=mF5ATrFD
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-38564b4b017so4110458eec.0
        for <loongarch@lists.linux.dev>; Mon, 23 Nov 2026 15:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20260707.gappssmtp.com; s=20260707; t=1795475405; x=1796080205; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:to
         :from:cc:in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1b1ocgQtSvefIuPciX0StsHzdHu/105xpXIeUHjXub4=;
        b=mF5ATrFDD4kB2RrCs9cXvVCPL4x6xhikYv1L49Ra8EBzGKO9+V7w9r1zXa5tLHiXc4
         QqkgNB2QnUFJwsYfyIpPxrawAVpoeiNaPiYOUwNoIdNZeU3cdrRECQq3mFyNmTlExt2I
         /yjgPA2CsZkUyXcI4uHdATugaa+vZZy/+LFRUYbwnbG94r+q0QsGSYZJwBkjVuvkRfHp
         c5lfrijP6iMTJMoECySeYtq25E8pK+zZ4t7z8nuRC8g6AA6O6TM6wQGgswU3+0r/7GdU
         al61wEe2+MQdsuzJNSTHIKqriiK9lifdEc6N83xnh+lrM6oM5wxS0uXQJwh8F1xIw+vE
         Ujmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795475405; x=1796080205;
        h=content-transfer-encoding:content-type:mime-version:message-id:to
         :from:cc:in-reply-to:subject:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1b1ocgQtSvefIuPciX0StsHzdHu/105xpXIeUHjXub4=;
        b=Mi7lU30qUojloj2tEJz5/i8giX2/GLfbGjUvUPMYGiU2hWp8SRxXGDc4XPLf0hZoKo
         hcH9YCKIku0XlEUoEXoCRHqJMzJsM3DSGaEk4IqSRY5YqfWgvoiNjKzVeP7IxSPdBeYG
         XEozJUaYH6R/s9IRfUdZADlZTfNeVKF7LpkqzhXfVwc1XTL5hOHOuIW6jbx0gL7f5r7c
         YB9qnqtyV8F0mhZejbJx/NHNQ+20GBTYhjVDTA1p2HRz3WqZDVjGcRKscpt+y7wHqkrA
         G46avo0Tly8GMaqw3Os2N1bKKbiIMbgOo1+VR9Ai6nFfsWBaEYsKMQtTzWrdS6nilXiK
         1ULA==
X-Forwarded-Encrypted: i=1; AL+hErEEcwE6oxRFnpx3O2stH99zVPrxUs10uIGaolU0MDCTrexrBky4xW6lETGUjEQ9cOT8dJtbNj/zrkA=@lists.linux.dev
X-Gm-Message-State: APuU4Z8VXlvXCjwb9JZLO7qqtrZiOlckuGPOjXUOlulx80D3QN1SV0du
	7IMCJeTg2VBfeOe0XnG/Ldim7Kf8o89HcwQbEMWamhabLkftJJkF70JQMotEPqc9kFc=
X-Gm-Gg: AZFdTZeMGdJOhEQykeSxe6iSGy9TkX7+KlErJC+rbOuSHzDunLdvGag1oThmHCWwLz1
	TwoNv6dN49UFpmL1SY/kmvAVfG6FLxQJ7onQtKjQjhGmRY5MKepSwx688z9dhp/9vN49YXI8BwX
	V/dkyOTyn+2mZWSgFiAa/htkE4/SFgU+7fk3gLZ/28UT51SUTyqn9cTxHRcDiDB8F9ji2hJZQz0
	jnKKLBif/94Lak/lIZN9TQT6qLXIAI57FB0D8Cm+E+2+l3+B5dTApEv05DNxqwyTMsEkucQMX6Z
	3OEEji/4IA5J/3boLKE1IxgevQl45fYLpzE7S3y3qhSekmQJGa08T7MJJJWMIBwOYETkXGAuaOQ
	ugQkfSXqiTLVLvKadcgLec8OdGb8B7TS90oGHQ8HHkYePSIdLFSdriEISYiQWDMa+w0YhtJIdv2
	OCckjXhJ6FFl4BY6bb9QT7n5KdhvitJ2oFsBNO2xfj05Otq7xgKfdqVht2nWURbp/kpzLyaxN02
	qgI1ghUnslvuJyEqnSYJddhKhuOZijU3KUM/0wmeTt4ZeS8+/Dht9U3VhbXHXUFkD5esu2lJPuT
	elQdx7Wm89g709r0dgQOZiDjIAME2kW0+zYEsLUEBXLCjIwy9tGEOzB1g0EDpjDUyTjO3+mrEE9
	yPqqSkldid8DP22FEal3WmdVvZI0=
X-Received: by 2002:a05:7022:296:10b0:1b4:facd:5311 with SMTP id a92af1059eb24-1b5524972dbmr12954441c88.8.1795475404449;
        Mon, 23 Nov 2026 15:10:04 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm43512853c88.14.2026.11.23.15.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:10:04 -0800 (PST)
Date: Mon, 23 Nov 2026 15:10:04 -0800 (PST)
X-Google-Original-Date: Mon, 23 Nov 2026 15:09:28 PST (-0800)
Subject:     Re: [PATCH v4 03/19] riscv: Make _text point to the start of the kernel image
In-Reply-To: <20261118182105.1633603-24-ardb+git@google.com>
CC: linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
  Ard Biesheuvel <ardb@kernel.org>, jgg@nvidia.com, pjw@kernel.org, aou@eecs.berkeley.edu, chenhuacai@kernel.org,
  loongarch@lists.linux.dev, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ardb+git@google.com
Message-ID: <mhng-FE6551A0-F38D-4B01-9727-CAB9CE10B667@Palmers-Mini.rwc.dabbelt.com>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Wed, 18 Nov 2026 10:21:09 PST (-0800), ardb+git@google.com wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
>
> On RISC-V, _text currently refers to the start of the .text output
> section, which is placed after the image header (.head.text), and is
> therefore equal to _stext. On other architectures such as arm64, _text
> refers to the start of the image, and is used as such by generic code,
> e.g., to describe the kernel mapping in /proc/kcore and in the ELF
> headers of the vmcore, and by the EFI stub.
>
> Now that arch/riscv no longer uses _text to refer to the start of the
> kernel code, move it to the start of the image so that it is equal to
> _start, and the distinction between _text and _stext is the same as on
> other architectures.
>
> This also means that the image header is no longer omitted from the
> /proc/kcore and vmcore kernel text mappings. Other users of _text, such
> as kallsyms and ftrace, only use it as a reference point to calculate
> relative offsets, and are not affected by this change.
>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/riscv/kernel/vmlinux.lds.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
> index 1f4f8496941a..9849a3e4d102 100644
> --- a/arch/riscv/kernel/vmlinux.lds.S
> +++ b/arch/riscv/kernel/vmlinux.lds.S
> @@ -28,11 +28,11 @@ SECTIONS
>  	/* Beginning of code and text segment */
>  	. = LOAD_OFFSET;
>  	_start = .;
> +	_text = .;
>  	HEAD_TEXT_SECTION
>  	. = ALIGN(PAGE_SIZE);
>
>  	.text : {
> -		_text = .;
>  		_stext = .;
>  		TEXT_TEXT
>  		SCHED_TEXT

Reviewed-by: Palmer Dabbelt <palmer@dabbelt.com>
Acked-by: Palmer Dabbelt <palmer@dabbelt.com>
