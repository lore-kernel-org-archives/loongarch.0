Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACB417F
	for <loongarch@lists.linux.dev>; Fri, 17 Feb 2023 07:08:20 +0000 (UTC)
Received: from loongson.cn (unknown [192.168.200.1])
	by gateway (Coremail) with SMTP id _____8BxNNjiJ+9jgKwBAA--.2931S3;
	Fri, 17 Feb 2023 15:08:18 +0800 (CST)
Received: from [0.0.0.0] (unknown [192.168.200.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxtOXhJ+9j_iE1AA--.64834S3;
	Fri, 17 Feb 2023 15:08:18 +0800 (CST)
Subject: Re: [PATCH v2] LoongArch: BPF: Use 4 instructions for function
 address in JIT
To: Hengqi Chen <hengqi.chen@gmail.com>
References: <20230214152633.2265699-1-hengqi.chen@gmail.com>
 <9b999261-9c6e-05a9-3213-b9f6dd2eaa07@loongson.cn>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, bpf@vger.kernel.org,
 loongarch@lists.linux.dev
From: Youling Tang <tangyouling@loongson.cn>
Message-ID: <bba05e0a-3d30-3c61-33af-08fed4aa9915@loongson.cn>
Date: Fri, 17 Feb 2023 15:08:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <9b999261-9c6e-05a9-3213-b9f6dd2eaa07@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8BxtOXhJ+9j_iE1AA--.64834S3
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7ArWDWw1xJw4rGF1DKFyDKFg_yoW8Aw4UpF
	Wa93ZakFWDXry8C3ZrJayfXFyakan5Jr4UJayUG3yI9r13Xwna9F1vgF1Y9asxt3ySkF12
	gr4jqrZ8Z3WqyFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bOxFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
	AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF
	7I0E14v26r1j6r4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7
	CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2
	zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_WwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0E
	wIxGrwCF04k20xvE74AGY7Cv6cx26rWl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1D
	MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
	0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWU
	JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0zRVWl
	kUUUUU=

Hi, Hengqi

On 02/16/2023 02:52 PM, Tiezhu Yang wrote:
>
>
> On 02/14/2023 11:26 PM, Hengqi Chen wrote:
>> This patch fixes the following issue of function calls in JIT, like:
>>
>>   [   29.346981] multi-func JIT bug 105 != 103
>>
>> The issus can be reproduced by running the "inline simple bpf_loop call"
>> verifier test.
>>
>> This is because we are emiting 2-4 instructions for 64-bit immediate
>> moves.
>> During the first pass of JIT, the placeholder address is zero, emiting
>> two
>> instructions for it. In the extra pass, the function address is in
>> XKVRANGE,
>> emiting four instructions for it. This change the instruction index in
>> JIT context. Let's always use 4 instructions for function address in JIT.
>> So that the instruction sequences don't change between the first pass and
>> the extra pass for function calls.
>>
>> Fixes: 5dc615520c4d ("LoongArch: Add BPF JIT support")
>> Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
>
> Tested-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>

In RISCV, I looked at the 'case BPF_JMP | BPF_CALL' handling，
emit_call
     emit_jump_and_link

The number of instructions is controlled by the 'force_jalr' parameter
in emit_jump_and_link().

force_jalr = true: auipc/jalr          (fixed-length)
force_jalr = false: jal or auipc/jalr  (variable-length)

"force_jalr" comes from "fixed" in bpf_jit_get_func_addr().

- In LoongArch, is it possible to do a similar operation by using
   'func_addr_fixed' to control whether it is variable, instead of
   using a fixed-length unconditionally through move_addr()?

- Commit information can refer to b54b6003612a ("riscv, bpf: Emit
   fixed-length instructions for BPF_PSEUDO_FUNC").

- In 'case BPF_LD | BPF_IMM | BPF_DW', is it also necessary to add
   BPF_PSEUDO_FUNC processing?

Youling.

