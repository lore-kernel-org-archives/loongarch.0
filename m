Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794857626;
	b=rq6X+YwWSIWACWBuwqEu3+1yXLGre4ct4qxzMlfXaqrCoIVeY4riNeFvnQTtm1Kr/87P
	 o4sgbBM/mvKYsHogtt2zpf5vMiNhEiE5DChB/+oZAzcTRq/e9FUKwPsJOmT9NViqPsoaV
	 pk8gUuUz4x0dfdpMnqRGRTf4CtJcLvCUFZNbt6wxoLUQD7FiS2T/picko1a/gONUxW89V
	 AbN/FEBBYKbo9rLgqNBhG78sPwm/OmEO+tg5zkiScOD2b8iBdhBcRxwnHfz3mYK7RLyc9
	 w7/uLh+mSqbPE8fzvAlhF5EJSCDI5qO27tIyUmTqXxmTu5Fu2tCXwxmU02I+qQPYQhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794857626;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type:Content-Transfer-Encoding;
	bh=PVpms2o1EVmRGV9LLOQ7J/09tS82gfik30j3xDX0yg0=;
	b=lHvhk0pHHE9t0Sygzt01chr7yXwIZ3q59yY4wTylq5wquzVgAd4iu9iccu0Vj7+gd2oC
	 DlLuhPUR5f+TNlEH0s9eMZtuq2PZ8IuZkJvnfEAtY4PWD0oc3kaE+UEWU+xkaHRYDl/PX
	 DS95NhXgmVLo+YHeviHufJHexKXeGSL0LntL4tYAyDtd76Ka5X7vsls6kQyjzlpwqRYdM
	 rJng4FqMCNQe0Xq5+n87HPLXV+aVRnYdLhvVm1kJhv13v3CCyuUmx5q/mkKAe/retKcCO
	 MTe89Nx64KMvadJjDaDF6aVQTlRygYoDNwz9bvHnEbfWDWGqLQeNyFvyPvckMAWCZ2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gf1CDNeL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C13606A323
	for <loongarch@lists.linux.dev>; Mon, 16 Nov 2026 19:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gf1CDNeL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E02A01F000C4;
	Mon, 16 Nov 2026 19:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794857626;
	bh=PVpms2o1EVmRGV9LLOQ7J/09tS82gfik30j3xDX0yg0=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=gf1CDNeL5ENoRZD3p+f9jZcdsNyv1TaVei3DXYBQzlgc1xpDoX+7sJQ6k/ofEUqOM
	 8t6pq5mkEQcRjwsoCTfjdUVyAOoWyl7uE1s56/bpaDkrm/RmV4v5BEYwS4daGQBVS/
	 NUVDfpTyfoFuYWIEHn1i/2ecp9tKT4FWBKgYEJYKhO42s2dft2wy3/HhWHjaKVOjQV
	 ybpXsMrUSSxWtupQD6dkuNQ1vo/jIs03S5GOrIIX3Jvr5LeHEhh0/uMypZAt549zIa
	 doONBNrSAqi5Oa8IcRJRa6SEs0/yDxvcWtywLavT7i4fxViS9EMxGStRFhzIOaVLdT
	 CTw5oViL7RuMg==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 4D0C5198003A;
	Mon, 16 Nov 2026 14:33:43 -0500 (EST)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Mon, 16 Nov 2026 14:33:43 -0500
X-ME-Sender: <xms:lVr7amuD3NuJhkSrpWp3VzZUR3jOpvkWDvXaegYsFvV86bEzMcaazg>
    <xme:lVr7amTqKIc2VuyaiZwhDWThqZXwXbVRzr7h7UA2s-Hb8lmhPDYVY2qmwdoQD6Of_
    sXli3_8BsneC929ZGNnqvEVa3T8-phI-ra4Gp3ZkaG0stnPx1zwCJ6A>
X-ME-Proxy-Cause: dmFkZTEsUjVsRuDkUa7AsdpqUHn/DF5gSGtgp0t8TzPcoTvUuShZj8JJiVDC3OOXEtCV2r
    HxvjuTO6TDcDBy4GimavF8rjlflLcDYxuACE4bWE8jDIzLK6SKIeI4JBs4haT51OcvNaKx
    9e+X0NK037q9wSnPrajH28ZKGPxwsGVq7FukXREgnna0dCjjQX7q+MOjOKLt9MoAsVeVOi
    Jm52s0xdZY71jDkcx8KTwcECX1OQpEaFUqPHUAVdZWlHMaUdAwjh2E4c6P6aeqx2q+U1/N
    x79WnOCzEspF2JvrVc78i54LZo+ejlLcS7YeDpkJyRkZZpFY9i1JAJXPwzjylm9ORgKtQF
    /aMbxdJUQWK81aLhl19MdNhjdVB9Q+ACijf9YH1N219JKM1YqIcEv6IwgjxHpwO5GOD2N2
    siWcWFDKFV+DA6wrBaES/aFDc6a7ieB7Ji2wB3QNEv3hf1xYArHqfbsgc6b2ndSQHiMlNc
    A9XBKaDJBDkXlVewYP87uORVQgpWsN3fcazwC76qgsJkN3mO/52EohAtJ6BhioFEAOav4u
    IUImWAFMCtziV2O0XBeGYfnqxojIg4z93Bwv+gA3EfMmnpPdKLHv67BnTSDHALDySWsIZK
    lzHLeAOzrIOGH+RbDtd9abhxcuC39anQmauxMw7nKt0mBDWfK0srTa80+ErA
X-ME-Proxy: <xmx:l1r7aqRlQwBrmsGSQoSroK7Eep_8sK5kGLtajL4VxTRLDVji1VAZiQ>
    <xmx:l1r7arpxGIzlQHI5imELvfpHUUzhULRwoA6c12SbhurpD4Wv8Dsgug>
    <xmx:l1r7ak2j2I9BdDpP7SYYFsBvWH05IiZYZdJ98OE8_LWw0pOKR20EBg>
    <xmx:l1r7aq4gIvAKsDs_Jr9kGXhDzNnekzOFgKqq86jNrQPlC_whL6ruDA>
    <xmx:l1r7aoR3nbTsrOemmnE0wakAmdbT8ugINVyDE11rW1COkcAB4HBeCpug>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 03D94F8008E; Mon, 16 Nov 2026 14:33:41 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Date: Mon, 16 Nov 2026 20:33:20 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Jason Gunthorpe" <jgg@nvidia.com>, "Ard Biesheuvel" <ardb+git@google.com>
Cc: linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Huacai Chen" <chenhuacai@kernel.org>,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org
Message-Id: <49bd9e1e-abfb-4dd9-9de5-fe4e94308fd1@app.fastmail.com>
In-Reply-To: <179485513572.2274641.13924640952978903053.b4-review@b4>
References: <20261116142618.1687025-17-ardb+git@google.com>
 <20261116142618.1687025-25-ardb+git@google.com>
 <179485513572.2274641.13924640952978903053.b4-review@b4>
Subject: Re: [PATCH v3 08/15] efi/libstub: arm64: Use struct efi_image_info to access
 image properties
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Mon, 16 Nov 2026, at 19:52, Jason Gunthorpe wrote:
>> [ ... 53 lines skipped ... ]
>> @@ -22,23 +21,23 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
>>  				 efi_handle_t image_handle,
>>  				 const struct efi_image_info **image_info)
>>  {
>> -	unsigned long kernel_size, kernel_codesize, kernel_memsize;
>> +	unsigned long kernel_base	= efistub_kernel_base(*image_info);
>> +	unsigned long kernel_size	= efistub_kernel_size(*image_info);
>> +	unsigned long kernel_codesize	= efistub_kernel_codesize(*image_info);
>> +	unsigned long kernel_memsize	= efistub_kernel_memsize(*image_info);
>>  	efi_status_t status;
>>  
>> -	if (image->image_base != _text) {
>> +	if (image->image_base != (void *)kernel_base) {
>>  		efi_err("FIRMWARE BUG: efi_loaded_image_t::image_base has bogus value\n");
>> -		image->image_base = _text;
>> +		image->image_base = (void *)kernel_base;
>>  	}
>>  
>> -	if (!IS_ALIGNED((u64)_text, SEGMENT_ALIGN))
>> +	if (!IS_ALIGNED(kernel_base, SEGMENT_ALIGN))
>>  		efi_err("FIRMWARE BUG: kernel image not aligned on %dk boundary\n",
>>  			SEGMENT_ALIGN >> 10);
>>  
>> -	kernel_size = _edata - _text;
>> -	kernel_codesize = __inittext_end - _text;
>> -	kernel_memsize = kernel_size + (_end - _edata);
>>  	*reserve_size = kernel_memsize;
>> -	*image_addr = (unsigned long)_text;
>> +	*image_addr = kernel_base;
>>  
>>  	status = efi_kaslr_relocate_kernel(image_addr, reserve_addr,
>>  					   reserve_size, kernel_size,
>
> There is a further consolidation here, the two places that call
> efi_kaslr_relocate_kernel() get the args from image_info, so we could
> just pass image_info directly and remove the duplicated extraction and
> extra parameters.
>
> It could then handle the image_info adjustment too instead of open
> coding it twice.
>

Indeed.

> I wonder if riscv should have the segment_align and image_base checks
> too? Maybe the whole function is just a call to
> efi_kaslr_relocate_kernel() ?
>

IIRC they were added specifically for RedHat's spectacularly buggy
GRUB fork at the the time, so maybe by now we can just remove those.

>> [ ... 9 lines skipped ... ]
>> -asmlinkage void primary_entry(void);
>> -
>> -unsigned long primary_entry_offset(void)
>> -{
>> -	/*
>> -	 * When built as part of the kernel, the EFI stub cannot branch to the
>> -	 * kernel proper via the image header, as the PE/COFF header is
>> -	 * strictly not part of the in-memory presentation of the image, only
>> -	 * of the file representation. So instead, we need to jump to the
>> -	 * actual entrypoint in the .text region of the image.
>> -	 */
>> -	return (char *)primary_entry - _text;
>> -}
>
> I think this hunk belongs to the previous patch which removed the
> caller?
>

Indeed.

> Anyhow, the logic looks fine to me
>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
>

Thanks.
